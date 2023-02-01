# Maintainer: Aren <rn+aur@peacevolution.org>
# Contributor: dni <office@dnilabs.com>

pkgname=pnc
pkgver=0.9.4
pkgrel=1
pkgdesc="libphonenumber command-line wrapper continued (by the sxmo project)"
url="https://git.sr.ht/~anjan/pnc"
arch=('x86_64' 'armv7h' 'aarch64')
depends=('libphonenumber' 'icu')
license=('Apache')
makedepends=('cmake' 'gawk')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~anjan/pnc/archive/$pkgver.tar.gz")
sha256sums=('a4852b5b15222c1846cc79d196c639aadf41615fded35fff33606f0639dffa42')

build() {
  cd "$pkgname-$pkgver"

  cmake -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None
  cmake --build build
}

check() {
  cd "$pkgname-$pkgver/build"
  ctest
}

package() {
  cd "$pkgname-$pkgver"

  DESTDIR="$pkgdir" cmake --install build
  rm -r "$pkgdir/usr/lib"
}
