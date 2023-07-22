# Maintainer: Berfin <3a33oxx40@mozmail.com>
# Previous Maintainer: Joao Cordeiro <jlcordeiro at gmail dot com>
# Contributor: St�phane Gaudreault <stephane.gaudreault@gmail.com>

pkgname=latencytop
pkgver=0.5.0
_pkgver=0.5
pkgrel=1
epoch=1
pkgdesc="A tool for software developers, aimed at identifying where system latency occurs."
arch=(x86_64)
url="http://ftp.de.debian.org/debian/pool/main/l/latencytop" # used to be http://www.latencytop.org but Intel appears to have killed it
depends=('gtk2' 'ncurses' 'gdk-pixbuf2' 'glib2')
license=('GPL')
source=("http://ftp.de.debian.org/debian/pool/main/l/latencytop/latencytop_0.5.0.orig.tar.gz"
        makefilefix.diff)
sha256sums=('9e7f72fbea7bd918e71212a1eabaad8488d2c602205d2e3c95d62cd57e9203ef'
            'ba86f1cc699dc0acfe24d70edfdffba14c1e0128885c874b098441096f368eae')

prepare() {
  cd $pkgname-${_pkgver}
  patch -Np1 < "$srcdir"/makefilefix.diff
}

build() {
  cd $pkgname-${_pkgver}
  make 
}

package() {
  cd $pkgname-${_pkgver}
  install -dm755 "$pkgdir"/usr/bin
  make DESTDIR="$pkgdir" install
}
