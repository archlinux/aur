# Maintainer:  Andrew O'Neill <andrew at meanjollies dot com>
# Contributor: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>

pkgname=mothur
pkgver=1.40.3
pkgrel=1
pkgdesc="A bioinformatics program for analyzing microbial communities"
arch=('i686' 'x86_64')
url="https://www.mothur.org/"
license=('GPL3')
depends=('boost-libs')
makedepends=('boost')
source=(https://github.com/$pkgname/$pkgname/archive/v$pkgver.tar.gz)
sha256sums=('7237e763b046ade1034bf39e3e76ee0256013b1d50103330f0177c3b0cb876f7')

prepare() {
  cd $pkgname-$pkgver

  sed -e 's|BOOST_LIBRARY_DIR="\\"Enter_your_boost_library_path_here\\""|BOOST_LIBRARY_DIR = /usr/lib|' \
      -e 's|BOOST_INCLUDE_DIR="\\"Enter_your_boost_include_path_here\\""|BOOST_INCLUDE_DIR = /usr/include|' \
      -i Makefile
}

build() {
  cd $pkgname-$pkgver

  make
}

package() {
  cd $pkgname-$pkgver

  install -Dm755 mothur $pkgdir/usr/bin/mothur
  install -Dm755 uchime $pkgdir/usr/bin/uchime
}
