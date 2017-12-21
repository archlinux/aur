# Maintainer: Michael Straube <straubem@gmx.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: kusakata <shohei atmark kusakata period com>

pkgname=galois
pkgver=0.5
pkgrel=1
pkgdesc='A computer game of the "falling blocks" type, but with unique features'
arch=('i686' 'x86_64')
url="http://www.nongnu.org/galois"
license=('GPL3')
depends=('gtkmm3' 'libxml++')
source=("https://download.savannah.gnu.org/releases/galois/source/galois-$pkgver.tar.gz"
        "galois-0.5-install-path.patch"
        "galois-0.5-libxml++3.0.patch")
sha256sums=('94eecd9f1038df5fd19b14ca5b2634bd00d0cd9c534a50a996558d8ac29fb394'
            'c4247271776f7b5df2b6bb92911c25a9ba3c30796171de5cd7dc1bd78e5a800d'
            '3d5302c362cadfb1e350153e373dfce9bfbefaf83fc3427069ce0cc071f84b86')

prepare() {
  cd $pkgname-$pkgver
  patch -p1 -i ../galois-0.5-install-path.patch
  patch -p1 -i ../galois-0.5-libxml++3.0.patch
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
