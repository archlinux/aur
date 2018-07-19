# Maintainer: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>
# shellcheck disable=2034
# shellcheck disable=2148

pkgname=archive-sum
pkgver=1.1.1
pkgrel=1
pkgdesc="verify archive file integrity"
arch=('i686' 'x86_64')
url="https://github.com/idiv-biodiversity/archive-sum"
license=('MIT')
depends=('libarchive')
makedepends=('meson')
source=("$pkgname-$pkgver.tar.gz::https://github.com/idiv-biodiversity/archive-sum/archive/v$pkgver.tar.gz")
md5sums=('5015014afd62de250b2d3513fce42705')

build() {
  arch-meson $pkgname-$pkgver build
  ninja -C build
}

check() {
  meson test -C build --no-suite lfs
}

package() {
  # shellcheck disable=2154
  DESTDIR="$pkgdir" ninja -C build install

  # shellcheck disable=2154
  install \
    -Dm644 \
    "$srcdir"/$pkgname-$pkgver/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
