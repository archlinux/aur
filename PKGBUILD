# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
# Contributor: Mick Elliot <micke at sfu dot ca>
pkgname=phyml
pkgver=3.3.20211118
pkgrel=1
epoch=1
pkgdesc="Builds phylogenies from DNA or protein sequences using a maximum likelihood approach"
arch=('i686' 'x86_64')
url="https://github.com/stephaneguindon/phyml"
license=('GPL2')
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha256sums=('6348e8c0b73f424a7e3315116c34fe864162235565ce2f5cf81b1a0d499ba177')

build() {
  cd "$srcdir/phyml-$pkgver"

  # Fix error: AM_INIT_AUTOMAKE expanded multiple times
  sed -i '/^AM_INIT_AUTOMAKE$/d' configure.ac

  ./autogen.sh
  ./configure --prefix=/usr --enable-phyml
  make
}

package() {
  cd "$srcdir/phyml-$pkgver"
  make DESTDIR="$pkgdir" install
}
