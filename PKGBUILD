# Maintainer: Michael Straube <straubem@gmx.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: kusakata <shohei atmark kusakata period com>

pkgname=galois
pkgver=0.4
pkgrel=6
pkgdesc='A computer game of the "falling blocks" type, but with unique features'
arch=('i686' 'x86_64')
url="http://www.nongnu.org/galois"
license=('GPL3')
depends=('gtkmm' 'libxml++')
source=("https://download.savannah.gnu.org/releases/galois/source/galois-$pkgver.tar.gz"
        "galois-install-path.patch"
        "galois-libxml++3.0.patch")
sha256sums=('a168ae6514da1eda5afd761fa4eeaf510d79988d450a716a0c41ce978d99e447'
            'c4247271776f7b5df2b6bb92911c25a9ba3c30796171de5cd7dc1bd78e5a800d'
            'fa58f17e43daf524073d7aaa700655f1b24fe929b7457e07e04e51916072bcc7')

prepare() {
  cd $pkgname-$pkgver
  patch -p1 -i ../galois-install-path.patch
  patch -p1 -i ../galois-libxml++3.0.patch
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
