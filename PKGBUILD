pkgname=vulkan-kompute-git 
pkgver=r380.9babbc5
pkgrel=3
pkgdesc="The General Purpose Vulkan Compute Framework. Blazing fast, mobile-enabled, asynchronous and optimized for advanced GPU data processing usecases. "
arch=('any')
url="kompute.cc"
license=('apache')
groups=()
depends=('vulkan-headers' 'spdlog' 'glslang')
makedepends=('git') 
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('vulkan-kompute::git+https://github.com/EthicalML/vulkan-kompute.git')
noextract=()
md5sums=('SKIP')


pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	export SCMP_BIN=glslangValidator
	cmake -Bbuild -DKOMPUTE_OPT_INSTALL=1 -DRELEASE=1 -DKOMPUTE_ENABLE_SPDLOG=1 -DKOMPUTE_OPT_BUILD_SHADERS=1
	make -C build
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" -C build install
}
