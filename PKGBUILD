# Maintainer: Winston Weinert  <winston@ml1.net>
pkgname=marlowe
pkgver=1.0
pkgrel=1
epoch=
pkgdesc="Shakespeare to C transpiler forked from spl with fixes"
arch=('i686' 'x86_64')
url="https://bitbucket.org/kcartmell/marlowe/"
license=('GPL')
groups=()
depends=('flex')
makedepends=('bison')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://bitbucket.org/kcartmell/marlowe/downloads/$pkgname-$pkgver.tar.gz"
       "$pkgname-$pkgver-Makefile.patch")
sha512sums=('48e1052e8e6fb28e97ec174784b0099613f05d6579edfdec478aa30a3498c30ccc079a0c53ebc72e3922618ceefd3e06b243f08a5a6177e2e76190448f84cc6b'
            '1f5699546d0fedbc59752ffd3318caf2cd3b4ac11ecb5042c97bcd60aee1b31efe894e5d9891bf2c40a7efeb5536fbde781515ec4249c3bbb9ef991f3450f516')
noextract=()

MAKEFLAGS='-j1'

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p0 -i "$srcdir/$pkgname-$pkgver-Makefile.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make install  # ayy lmao (it doesn't actually install things)
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  mkdir -p "$pkgdir/usr/bin"
  install -m 755 spl/bin/spl2c "$pkgdir/usr/bin/"
  mkdir -p "$pkgdir/usr/lib"
  install -m 644 spl/lib/libspl.a "$pkgdir/usr/lib/"
  mkdir -p "$pkgdir/usr/include"
  install -m 644 spl/include/spl.h "$pkgdir/usr/include/"
}

# vim:set ts=2 sw=2 et:
