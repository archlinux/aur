# Maintainer: Danko Aleksejevs <danko@very.lv>
# Contributor: Matthias De Bie <mattydebie@gmail.com>
# Contributor: Yi donghoon <icq4ever@gmail.com>
pkgname='kemai'
pkgdesc='A QT6 client for Kimai time tracker'
pkgver='0.11.1'
pkgrel=3
url="https://github.com/AlexandrePTJ/kemai"
arch=('i686' 'x86_64')
license=('MIT')
source=("https://github.com/AlexandrePTJ/kemai/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('cfb51ffd44e56cf67a5f9c6c6a9ae45efce1bf6f0b75c91c789da18a04711ff2')
makedepends=('cmake' 'range-v3' 'magic_enum' 'qt6-tools')
depends=('qt6-base' 'spdlog' 'libxss' 'hicolor-icon-theme' 'fmt' 'libx11')

build() {
  cmake kemai-${pkgver} \
    -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DKEMAI_BUILD_LOCAL_DEPENDENCIES=OFF \
    -DCMAKE_CXX_STANDARD_INCLUDE_DIRECTORIES=/usr/include/magic_enum \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 kemai-${pkgver}/LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}
