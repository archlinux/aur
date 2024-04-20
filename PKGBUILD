# Maintainer: Danko Aleksejevs <danko@very.lv>
# Contributor: Matthias De Bie <mattydebie@gmail.com>
# Contributor: Yi donghoon <icq4ever@gmail.com>
pkgname='kemai'
pkgdesc='A QT6 client for Kimai time tracker'
pkgver='0.10.0'
pkgrel=1
url="https://github.com/AlexandrePTJ/kemai"
arch=('i686' 'x86_64')
license=('MIT')
source=("https://github.com/AlexandrePTJ/kemai/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('2b77fcc915f2bdc6012d43cd65570363e2ca7ba38a424fe1242b1cfc3655f1eb')
makedepends=('cmake' 'range-v3' 'magic_enum' 'qt6-tools')
depends=('qt6-base' 'spdlog' 'libxss' 'hicolor-icon-theme')

build() {
  cmake kemai-${pkgver} \
    -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DFETCHCONTENT_FULLY_DISCONNECTED=ON \
    -DFETCHCONTENT_TRY_FIND_PACKAGE_MODE=ALWAYS \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 kemai-${pkgver}/LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}
