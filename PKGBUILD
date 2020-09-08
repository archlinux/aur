# Maintainer: Justin Coffman <jcoffman@strongsec.io>

pkgname=tinyfugue5
pkgver=5.0b8
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc='TinyFugue, aka "tf", is a flexible, screen-oriented MUD client, for use with any type of text MUD.'
url="http://tinyfugue.sourceforge.net/"
license=('GPL3')
makedepends=('git')
depends=('pcre' 'openssl')
source=("git+https://github.com/strongsecio/tinyfugue.git#tag=v$pkgver-$pkgrel")
sha256sums=('SKIP')

# build function
build() {
  cd "$srcdir/tinyfugue"

  ./configure --prefix=/usr
  make
}

# package function
package() {
  cd "$srcdir/tinyfugue"

  mkdir "$pkgdir/usr"
  make prefix="$pkgdir/usr" -j1 install

  install -d "$pkgdir/usr/share/man/man1"
  install -m 644 src/tf.1.nroffman "$pkgdir/usr/share/man/man1/tf.1"
}
