# Maintainer: dragoneki <dragoneki at proton dot me>
pkgname=krunner-bazaar
pkgver=1.2.2
pkgrel=2
pkgdesc="KRunner plugin for bazaar"
arch=('x86_64')
url="https://github.com/ublue-os/krunner-bazaar"
license=('Apache-2.0')
depends=('qt6-base' 'krunner' 'ki18n' 'kcoreaddons')
makedepends=('cmake' 'extra-cmake-modules' 'git')
optdepends=('bazaar: install if not using the flatpak version')
source=("https://github.com/ublue-os/krunner-bazaar/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f925b455642aa3c3be77f2fcc05e2398078f3e54afb010ff9b2d56b389dbd25a')

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
