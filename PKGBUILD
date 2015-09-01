# Maintainer: oi_wtf <brainpower at mailbox dot org>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Vladimir Kirillov <proger@wilab.org.ua>

_pkgname=libpgm
pkgname=lib32-libpgm
pkgver=5.2.122
pkgrel=1
pkgdesc="OpenPGM: implementation of the Pragmatic General Multicast (PGM, RFC3208)"
arch=('i686' 'x86_64')
url="http://code.google.com/p/openpgm"
license=('LGPL2.1')
depends=('lib32-glibc')
makedepends=('python2')
options=(!strip)
source=("http://openpgm.googlecode.com/files/$_pkgname-$pkgver.tar.gz")
sha256sums=('6b895f550b95284dcde7189b01e04a9a1c1f94579af31b1eebd32c2207a1ba2c')


prepare() {
  cd "$srcdir/$_pkgname-$pkgver/openpgm/pgm"
  find . -type f -exec sed -i 's/python/python2/g' {} \+
}

build() {
  cd "$srcdir/$_pkgname-$pkgver/openpgm/pgm"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver/openpgm/pgm"
  make prefix="$pkgdir/usr" install

  # lib32 cleanup
  rm -rf "$pkgdir"/usr/{bin,lib,include,share} "$pkgdir/etc"
}

