# Maintainer: Sergey Kostyuchenko <derfenix@gmail.com>

pkgname=corectrl
pkgver=1.1.2
pkgrel=2
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
sha512sums=('7435a82d0a012c42cbfae21df9ff95e8c7c6fe0b4299fc1404d9409454a29fed5a6c59ca2df5211b11ba23b284c070f5af255eb287c6df131067f7c078c03f40')

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
