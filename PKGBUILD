# Contributor: Murtuza Akhtari <inxsible at gmail com>
# Contriburor: Andrea Scarpino <bash.lnx@gmail.com>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=cplay
pkgver=1.49
pkgrel=5
pkgdesc="A curses front-end for various audio players."
arch=('i686' 'x86_64')
url="http://mask.tf.hut.fi/~flu/cplay/"
license=('GPL2')
groups=()
provides=()
conflicts=()
replaces=()
depends=('ncurses' 'python2')
makedepends=()
checkdepends=()
optdepends=('mpg321' 'mpg123' 'vorbis-tools' 'speex')
backup=('etc/cplayrc')
install=
source=("http://ftp.de.debian.org/debian/pool/main/c/$pkgname/${pkgname}_${pkgver}.orig.tar.gz")
noextract=()
md5sums=('fae9e13b8dafd98ffcd58cf9d6f92f33')
sha1sums=('5dc77ad0046419f6657249fa95829b3714beb1d6')
sha256sums=('4c624a7e5839b1523418b0b898dc300c571099a7e7252265ee79f7adbed0a80d')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i '1s,env python,&2,' cplay
  sed -i 's|PREFIX = /usr/local|PREFIX = /usr|' Makefile
  sed -i 's|$(PREFIX)/man/man1|$(PREFIX)/share/man/man1|' Makefile
}

build() {
  cd $srcdir/$pkgname-$pkgver
  make
  make cplayrc
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p $pkgdir/usr/{bin,share/man/man1}
  install -D -m644 cplayrc $pkgdir/etc/cplayrc
  make PREFIX=$pkgdir/usr install
}

