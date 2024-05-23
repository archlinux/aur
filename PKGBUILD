# Maintainer: Danko Aleksejevs <danko@very.lv>
# Contributor: Matthias De Bie <mattydebie@gmail.com>
# Contributor: Yi donghoon <icq4ever@gmail.com>
pkgname='kemai'
pkgdesc='A QT6 client for Kimai time tracker'
pkgver='0.11.0'
pkgrel=1
url="https://github.com/AlexandrePTJ/kemai"
arch=('i686' 'x86_64')
license=('MIT')
source=("https://github.com/AlexandrePTJ/kemai/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('ee2049b0ac676e0a06dcd81caab997072b4a5dfbb4fb3dddb695d5291258509d')
makedepends=('cmake' 'range-v3' 'magic_enum' 'qt6-tools')
depends=('qt6-base' 'spdlog' 'libxss' 'hicolor-icon-theme')

build() {
  cmake kemai-${pkgver} \
    -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DKEMAI_BUILD_LOCAL_DEPENDENCIES=OFF \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 kemai-${pkgver}/LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}
