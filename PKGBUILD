# Maintainer: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>

pkgname=mothur
pkgver=1.39.5
pkgrel=1
pkgdesc="computational microbial ecology"
arch=('i686' 'x86_64')
url="https://www.mothur.org/"
license=('GPL3')
depends=('boost-libs')
makedepends=('boost')

source=("$pkgname-$pkgver.tar.gz::https://github.com/mothur/mothur/archive/v$pkgver.tar.gz")

prepare() {
  cd $srcdir/$pkgname-$pkgver

  sed -e 's|BOOST_LIBRARY_DIR="\\"Enter_your_boost_library_path_here\\""|BOOST_LIBRARY_DIR = /usr/lib|' \
      -e 's|BOOST_INCLUDE_DIR="\\"Enter_your_boost_include_path_here\\""|BOOST_INCLUDE_DIR = /usr/include|' \
      -i Makefile
}

build() {
  cd $srcdir/$pkgname-$pkgver

  make
}

package() {
  cd $srcdir/$pkgname-$pkgver

  install -Dm755 mothur $pkgdir/usr/bin/mothur
  install -Dm755 uchime $pkgdir/usr/bin/uchime
}

md5sums=('1f826ea4420e6822fc0db002c5940b92')
