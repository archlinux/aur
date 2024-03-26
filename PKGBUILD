# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=cadical
pkgver=1.9.5
pkgrel=1
pkgdesc="A simple CDCL satisfiability solver"
arch=('x86_64')
url="http://fmv.jku.at/cadical/"
license=('MIT')
depends=('gcc-libs' 'glibc')
source=("https://github.com/arminbiere/cadical/archive/rel-$pkgver.tar.gz")
b2sums=('68c7fcc35ef0ad5082d5bbc828363ee45c2e637f281f1829ffb34047fff73775d34615e0ac37b8b49ff20b941db85b72c0dd6de0ab5ec5a690fd80fb5489b212')
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
