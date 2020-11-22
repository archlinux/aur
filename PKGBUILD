# Maintainer: Sergey Kostyuchenko <derfenix@gmail.com>

pkgname=corectrl
pkgver=1.1.1
pkgrel=3
pkgdesc="Core control application"
url="https://gitlab.com/corectrl/corectrl"
license=('GPL3')
arch=('i686' 'x86_64')
depends=('procps-ng' 'hwids' 'karchive' 'kauth' 'qt5-charts' 'qt5-quickcontrols2' 'qt5-base>=5.9' 'botan>=2.2.0' 'qt5-svg' 'qt5-xmlpatterns' 'qt5-base')
makedepends=('cmake>=3.3' 'qt5-tools' 'karchive' 'gcc>=8' 'extra-cmake-modules')
optdepends=(
	'vulkan-tools: For vulkaninfo'
	'mesa-demos: For glxinfo',
	'util-linux: For lscpu'
)
source=("https://gitlab.com/corectrl/corectrl/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.bz2")
sha512sums=('196bcb34e60923736840a5178638f0eac6106beb0f69f405e8d64f150e7d304f459b8093a209ef4aaa8588def7ceed48879831e737dc467c3abcde6c46edd5c1')

build() {
  cmake -B build -S "$pkgname-v$pkgver" \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DBUILD_TESTING=OFF \
  -Wno-dev
  make -C build
}


package() {
  make -C build DESTDIR="$pkgdir" install
}
