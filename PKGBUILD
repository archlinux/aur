# Maintainer: Mort Yao <soi@mort.ninja>

pkgname=pdksh
pkgver=5.2.14
pkgrel=7
pkgdesc="A public domain clone of the AT&T Korn shell"
arch=('i686' 'x86_64')
url="http://www.cs.mun.ca/~michael/pdksh/"
license=('custom')
depends=('glibc')
install=pdksh.install
conflict=('ksh')
source=(
http://www.cs.mun.ca/~michael/pdksh/files/pdksh-${pkgver}.tar.gz
pdksh-5.2.14.patch)
md5sums=('871106b3bd937e1afba9f2ef7c43aef3'
         '3c746b7f7cee1710033c5ba6af5b5a9b')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np1 -i ../$pkgname-$pkgver.patch
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  unset CPPFLAGS
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make prefix="$pkgdir" mandir="$pkgdir/usr/share/man/man1" install
  install -D -m644 LEGAL "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
