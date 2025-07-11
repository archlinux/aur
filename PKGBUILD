# Maintainer: dragoneki <dragoneki at proton dot me>
pkgname=krunner-bazaar
pkgver=1.0.4
pkgrel=1
pkgdesc="KRunner plugin for bazaar"
arch=('x86_64')
url="https://github.com/ublue-os/krunner-bazaar"
license=('Apache-2.0')
depends=('qt6-base' 'krunner' 'ki18n' 'kcoreaddons' 'bazaar')
makedepends=('cmake' 'extra-cmake-modules' 'git')
source=("https://github.com/ublue-os/krunner-bazaar/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ab7b891272c633b36ab784a1751b18cb8c2140fdfb03a63d21248350339f7e56')

build() {
  cd "${pkgname}-${pkgver}"
  cmake -B build -S . \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=OFF
  cmake --build build -j$(nproc)
}

package() {
  cd "${pkgname}-${pkgver}"
  cmake --install build --prefix="$pkgdir/usr"
}
