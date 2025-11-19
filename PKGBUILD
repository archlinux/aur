# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=cadical
pkgver=2.2.0
pkgrel=1
pkgdesc="Simple CDCL satisfiability solver"
arch=('x86_64')
url="https://fmv.jku.at/cadical/"
license=('MIT')
depends=('gcc-libs' 'glibc')
source=("https://github.com/arminbiere/cadical/archive/rel-$pkgver.tar.gz")
b2sums=('58262a1bcb0e11645b4a9aeab609a56677285bd914523c79e67b9c0c91b7f3376199d10a2a7aa7d3bc28c06f27d6602d1faf799b2e7c0f7ae271b64e382eb5b0')
options=('!lto')

build() {
  cd "$srcdir/$pkgname-rel-$pkgver"
  ./configure \
      --logging \
      -shared
  make
}

check() {
  cd "$srcdir/$pkgname-rel-$pkgver"
  make test
}

package() {
  cd "$srcdir/$pkgname-rel-$pkgver"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 BUILD.md "$pkgdir/usr/share/doc/$pkgname/BUILD.md"
  install -Dm644 CONTRIBUTING.md "$pkgdir/usr/share/doc/$pkgname/CONTRIBUTING.md"
  install -Dm644 NEWS.md "$pkgdir/usr/share/doc/$pkgname/NEWS.md"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

  cd src
  install -Dm644 ccadical.h  "$pkgdir/usr/include/ccadical.h"
  install -Dm644 cadical.hpp  "$pkgdir/usr/include/cadical.hpp"

  cd ../build
  install -Dm755 cadical      "$pkgdir/usr/bin/cadical"
  install -Dm755 mobical      "$pkgdir/usr/bin/mobical"
  install -Dm644 libcadical.a "$pkgdir/usr/lib/libcadical.a"
}
