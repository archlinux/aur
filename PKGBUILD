# Maintainer: Local User <user@localhost>
pkgname=dcat
pkgver=r30.ea1b44c
pkgrel=1
pkgdesc="A terminal-based 3D model viewer using Vulkan"
arch=('x86_64')
url="https://github.com/Murat65536/dcat"
license=('Apache')
depends=('vulkan-icd-loader' 'assimp' 'glm' 'libsixel')
makedepends=('cmake' 'shaderc' 'git')
options=('!debug')
install=dcat.install
source=("dcat::git+https://github.com/Murat65536/dcat.git")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	# Explicitly setting CMAKE_BUILD_TYPE to Release as requested
	cmake -B build -S "$pkgname" \
		-DCMAKE_BUILD_TYPE='Release' \
		-DCMAKE_INSTALL_PREFIX='/usr' \
		-Wno-dev
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
