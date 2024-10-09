# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=cadical
pkgver=2.1.0
pkgrel=1
pkgdesc="Simple CDCL satisfiability solver"
arch=('x86_64')
url="http://fmv.jku.at/cadical/"
license=('MIT')
depends=('gcc-libs' 'glibc')
source=("https://github.com/arminbiere/cadical/archive/rel-$pkgver.tar.gz")
b2sums=('23eeb40a9f0f7aadb492b067c241be09c93df05ee4ab558ab3936b2b6863a5086ace8ba01b421f47d09eb8852c2a3ee94d88804ea9a71063286d08c4a3339332')
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
