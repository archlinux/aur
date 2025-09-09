# Maintainer: dragoneki <dragoneki at proton dot me>
pkgname=krunner-bazaar
pkgver=1.2.1
pkgrel=2
pkgdesc="KRunner plugin for bazaar"
arch=('x86_64')
url="https://github.com/ublue-os/krunner-bazaar"
license=('Apache-2.0')
depends=('qt6-base' 'krunner' 'ki18n' 'kcoreaddons')
makedepends=('cmake' 'extra-cmake-modules' 'git')
optdepends=('bazaar: install if not using the flatpak version')
source=("https://github.com/ublue-os/krunner-bazaar/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ceef3e7641985af7cafe21fbaa03a3ca6d5d4436f9f8f7cc1f3e64b099791f3b')

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
