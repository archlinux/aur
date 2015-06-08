# Maintainer: willemw <willemw12@gmail.com>
# Contributor: blaise <blaise@gmail.com>

pkgname=xtail
_pkgver=2.1-5
pkgver=2.1
pkgrel=7
pkgdesc="Tail multiple logfiles at once, even if rotated"
arch=('i686' 'x86_64')
url="http://www.unicom.com/sw/xtail/"
license=('BSD')
source=(http://ftp.debian.org/debian/pool/main/x/xtail/xtail_$pkgver.orig.tar.gz
        http://ftp.debian.org/debian/pool/main/x/xtail/xtail_$_pkgver.diff.gz)
md5sums=('2e4717c591a2cbbd4aeb63d00c87a0cb'
         '24f33d989e9e49d8ce12e9a1d41d9665')

prepare() {
  chmod -R +w $pkgname-$pkgver
  patch -Np0 -i xtail_$_pkgver.diff
}

build() {
  cd $pkgname-$pkgver
  autoreconf -v
  ./configure --prefix="$pkgdir/usr/bin" --mandir="$pkgdir/usr/share/man"
  make
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 xtail $pkgdir/usr/bin/xtail
  install -Dm644 xtail.1 $pkgdir/usr/share/man/man1/xtail.1
  install -Dm644 README $pkgdir/usr/share/doc/$pkgname/README
}

