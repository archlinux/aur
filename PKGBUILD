# Maintainer: Aren <rn+aur@peacevolution.org>
# Contributor: dni <office@dnilabs.com>

pkgname=pn
pkgver=0.9.0
pkgrel=1
pkgdesc="libphonenumber command-line wrapper"
url="https://github.com/Orange-OpenSource/pn"
arch=('x86_64' 'armv7h' 'aarch64')
depends=('libphonenumber' 'icu')
license=('Apache')
makedepends=('cmake' 'gawk')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('345a80e812da016d6e6dd77be932c2735d9630e0ad626516774e1455de8b2722')

build() {
  cd "$pkgname-$pkgver"

  cmake -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None
  cmake --build build
}

package() {
  cd "$pkgname-$pkgver"

  DESTDIR="$pkgdir" cmake --install build
  mv "$pkgdir/usr/man" "$pkgdir/usr/share/"
}
