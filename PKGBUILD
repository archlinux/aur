# Maintainer: Luigi311 <aur@luigi311.com>
pkgname=svt-hevc-git
pkgver=r368.eb24a06
pkgrel=1
pkgdesc="The Scalable Video Technology for HEVC Encoder (SVT-HEVC Encoder) is an HEVC-compliant encoder library core."
arch=('x86_64' 'i686')
url="https://github.com/OpenVisualCloud/SVT-HEVC"
license=('GPL')
groups=()
depends=()
makedepends=('cmake' 'gcc' 'yasm' 'git')
checkdepends=()
optdepends=()
provides=('svt-hevc')
conflicts=('svt-hevc')
replaces=('svt-hevc')
backup=()
options=()
install=
changelog=
source=(svt-hevc::git+https://github.com/OpenVisualCloud/SVT-HEVC.git)
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	mkdir -p build
	cd build
	cmake .. -DCMAKE_BUILD_TYPE='Release' \
	-DCMAKE_INSTALL_PREFIX='/usr' \
	-DBUILD_TESTING=False
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"/build
	make DESTDIR="$pkgdir/" install
}
