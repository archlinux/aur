# Maintainer: dragoneki <dragoneki at proton dot me>
pkgname=krunner-bazaar
pkgver=1.0.4
pkgrel=1
pkgdesc="KRunner plugin for bazaar"
arch=('x86_64')
url="https://github.com/ublue-os/krunner-bazaar"
license=('Apache-2.0')
depends=('qt6-base' 'krunner' 'ki18n' 'kcoreaddons')
makedepends=('cmake' 'extra-cmake-modules' 'git')
source=("$pkgname::git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd "$pkgname"
  cmake -B build -S . \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=OFF
  cmake --build build -j$(nproc)
}

package() {
  cd "$pkgname"
  cmake --install build --prefix="$pkgdir/usr"
}
