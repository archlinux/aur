# Contributor: karnath <karnathtorjian@gmail.com>
# Contributor: TDY <tdy@gmx.com>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=barnowl
pkgver=1.9
pkgrel=1
pkgdesc="A curses-based client, it supports AOL Instant Messenger, MIT Zephyr, Jabber, IRC, and Twitter."
arch=('i686' 'x86_64')
url="http://barnowl.mit.edu/"
license=('BSD' 'GPL')
depends=('glib-perl' 'perl-authen-sasl' 'perl-digest-sha1'
     'perl-io-socket-ssl' 'perl-class-accessor' 'perl-net-dns'
     'perl-par' 'perl-json' 'perl-net-twitter-lite'
     'perl-text-autoformat' 'perl-anyevent' 
     'perl-anyevent-irc' 'zephyr')
makedepends=('zip')
checkdepends=()
optdepends=()
provides=()
conflicts=('mit-barnowl')
replaces=()
backup=()
options=()
install=
changelog=
source=("http://barnowl.mit.edu/dist/$pkgname-$pkgver-src.tgz")
noextract=()
md5sum=('bee663fae54476e46fdbe48f69febb38')
sha1sums=('5ff6ff46e5945b68a3d5cb2f541558790f984126')
sha256sums=('7586299c2c2c028afd2a6457c4de3bdd230ae33443fc00097c081c96a3c693d2')

prepare() {
  cd $srcdir/$pkgname-$pkgver-src
  sed -i "s/ncursesw\///" owl.h
  sed -i "s/ncursesw\///" tester.c

}

build() {
  cd $srcdir/$pkgname-$pkgver-src
  ./configure --prefix=/usr   \
    --includedir=/usr/include \
    --mandir=/usr/share/man   \
    --docdir=/usr/share/doc/$pkgname
  make
}

check() {
  cd $srcdir/$pkgname-$pkgver-src
  make -k check
}

package() {
  cd $srcdir/$pkgname-$pkgver-src
  make DESTDIR=$pkgdir install
  mkdir -p $pkgdir/usr/share/$pkgname/examples
  install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
  install -m644 doc/*.txt $pkgdir/usr/share/doc/$pkgname/
  install -m644 examples/* $pkgdir/usr/share/$pkgname/examples/
}

