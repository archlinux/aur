# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
# Contributor: Mick Elliot <micke at sfu dot ca>
pkgname=phyml
pkgver=3.3.20211021
pkgrel=1
epoch=1
pkgdesc="Builds phylogenies from DNA or protein sequences using a maximum likelihood approach"
arch=('i686' 'x86_64')
url="https://github.com/stephaneguindon/phyml"
license=('GPL2')
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha256sums=('8dd6519ccbf73ce67e57bc7681f6dffdbbc63e78e15aae79394f3ec362d42c2d')

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
