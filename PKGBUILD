# Maintainer: Julian Pollinger <julian@pollinger.dev>
# Contributor: Kyle Keen <keenerd@gmail.com>

_pkgname=cadical
pkgname=$_pkgname-pic
pkgver=1.7.4
pkgrel=1
pkgdesc="A simple CDCL satisfiability solver with feature PIC enabled"
arch=('x86_64')
url="http://fmv.jku.at/cadical/"
license=('MIT')
depends=('glibc' 'gcc-libs')
source=("https://github.com/arminbiere/cadical/archive/rel-$pkgver.tar.gz")
sha256sums=('866c8a1332ff1ad5dc7ad403bdef3164420f3f947816b5c9509aad1d18ada7a1')
provides=("cadical=$pkgver")
conflicts=('cadical')

build() {
  cd "$srcdir/$_pkgname-rel-$pkgver"
  ./configure -fPIC
  make
}

package() {
  cd "$srcdir/$_pkgname-rel-$pkgver"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  cd src
  install -Dm644 cadical.hpp  "$pkgdir/usr/include/cadical.hpp"
  cd ..
  cd build
  install -Dm755 cadical      "$pkgdir/usr/bin/cadical"
  install -Dm755 libcadical.a "$pkgdir/usr/lib/libcadical.a"
}

