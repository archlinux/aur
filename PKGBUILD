# Maintainer: hendy643 <phenderson643 at gmail dot com>
pkgname=rabbitvcs-dolphin-git
pkgver=r3.76f4dc0
pkgrel=1
pkgdesc='RabbitVCS integration for the Dolphin file manager'
arch=(x86_64)
url='https://github.com/hendy643/rabbitvcs-dolphin'
license=(GPL-2.0-or-later)
depends=(dolphin rabbitvcs-cli kcoreaddons kio qt6-base)
makedepends=(git cmake extra-cmake-modules)
provides=(rabbitvcs-dolphin)
conflicts=(rabbitvcs-dolphin)
source=("$pkgname::git+$url.git")
sha256sums=(SKIP)

pkgver() {
  cd "$pkgname"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cmake -S "$pkgname" -B build -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
