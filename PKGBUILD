# Maintainer: metscoin <mets_coin@outlook.com>

pkgname=gincoin-qt
pkgver=1.1.0
pkgrel=1
arch=('i686' 'x86_64')
url="https://gincoin.io/"
license=('MIT')
pkgdesc="Cryptocurrency wallet(QT)"
depends=(boost-libs qt5-base qrencode miniupnpc db4.8 zeromq protobuf libevent)
makedepends=(boost qt5-tools)
conflicts=(gincoin)
install=gincoin-qt.install
source=("${pkgname%-git}::git+http://github.com/gincoin-dev/gincoin-core.git"
        "$pkgname.desktop" "secp256k1.patch")
sha256sums=('SKIP'
            'b83e0ae6eebff11b261a1b26152c84e4425106346d1995871d346b908aa6a0de'
            'fa64cd539fe8aa118b443c46ed1d8a73c5537dc41467f1e28235ed78355a17cd')

prepare() {
   cd "$srcdir/$pkgname"
   patch -p1 -i "../secp256k1.patch" 
}

build() {
  cd "$srcdir/$pkgname"
  ./autogen.sh
  ./configure --with-gui=qt5
  make
}


package() {
  install -Dm644 gincoin-qt.desktop "$pkgdir"/usr/share/applications/gincoin.desktop
  cd "$srcdir/$pkgname"
  install -Dm755 src/qt/gincoin-qt "$pkgdir"/usr/bin/gincoin-qt
  install -Dm644 share/pixmaps/gincoin128.png "$pkgdir"/usr/share/pixmaps/gincoin128.png
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
