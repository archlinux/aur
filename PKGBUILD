# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=cadical
pkgver=2.0.0
pkgrel=1
pkgdesc="Simple CDCL satisfiability solver"
arch=('x86_64')
url="http://fmv.jku.at/cadical/"
license=('MIT')
depends=('gcc-libs' 'glibc')
source=("https://github.com/arminbiere/cadical/archive/rel-$pkgver.tar.gz")
b2sums=('76b738aef8063b96b11098be132bd9921cc6e4f39efe4c14916e1b9fb9517f464771a8f4fcc116a1a37fcd44b71513bb94516b3c81699f4d5417dde0e69ddb0c')
options=('!lto')

build() {
  cd "$srcdir/$pkgname-rel-$pkgver"
  ./configure
  make CXXFLAGS+="${CXXFLAGS} -fPIC"
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
