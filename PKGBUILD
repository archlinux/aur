# Maintainer: Sergey Kostyuchenko <derfenix@gmail.com>

pkgname=corectrl
pkgver=1.2.2
pkgrel=3
pkgdesc="Core control application"
url="https://gitlab.com/corectrl/corectrl"
license=('GPL3')
arch=('i686' 'x86_64')
depends=('procps-ng' 'hwdata' 'karchive' 'kauth' 'qt5-charts' 'qt5-quickcontrols2' 'qt5-base>=5.9' 'botan>=2.2.0' 'qt5-svg' 'qt5-xmlpatterns' 'qt5-base')
makedepends=('cmake>=3.3' 'qt5-tools' 'karchive' 'gcc>=8' 'extra-cmake-modules')
optdepends=(
	'vulkan-tools: For vulkaninfo'
	'mesa-utils: For glxinfo',
	'util-linux: For lscpu'
)
source=("https://gitlab.com/corectrl/corectrl/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.bz2")
sha512sums=('e68ca475f7ff70d5dad7f76274b5712343c061d2c5c81975cbb236a0c41045371b9dafd5149463b14e2997fcbd1f2a3e5f195318a6d1403d0bf6febae286713e')

build() {
  rm -rf build
  cmake -B build -S "$pkgname-v$pkgver" \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DBUILD_TESTING=OFF \
  -Wno-dev
  make -C build
}


package() {
  make -C build DESTDIR="$pkgdir" install
}
