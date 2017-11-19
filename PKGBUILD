# Maintainer:  Andrew O'Neill <andrew at meanjollies dot com>
# Contributor: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>

pkgname=mothur
pkgver=1.39.5
pkgrel=2
pkgdesc="A bioinformatics program for analyzing microbial communities"
arch=('i686' 'x86_64')
url="https://www.mothur.org/"
license=('GPL3')
depends=('boost-libs')
makedepends=('boost')
source=(https://github.com/$pkgname/$pkgname/archive/v$pkgver.tar.gz)
sha256sums=('9f1cd691e9631a2ab7647b19eb59cd21ea643f29b22cde73d7f343372dfee342')

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
