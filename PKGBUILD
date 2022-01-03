# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
# Contributor: Mick Elliot <micke at sfu dot ca>
pkgname=phyml
pkgver=3.3.20211231
pkgrel=1
epoch=1
pkgdesc="Builds phylogenies from DNA or protein sequences using a maximum likelihood approach"
arch=('i686' 'x86_64')
url="https://github.com/stephaneguindon/phyml"
license=('GPL2')
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha256sums=('5822c04f1b8ad7f9ef5aecaacc124f736b78344eb8cf459a230c727152734d99')

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
