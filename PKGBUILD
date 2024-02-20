# Maintainer:  Andrew O'Neill <andrew at haunted dot sh>
# Contributor: Kevin Slagle <kjslag at gmail dot com>

pkgname=regina-normal
pkgver=7.3
pkgrel=1
pkgdesc='Software for low-dimensional topology'
arch=('x86_64')
url='https://regina-normal.github.io'
license=('GPL-2.0-or-later')
depends=('gmp' 'graphviz' 'jansson' 'libxml2' 'popt' 'python3' 'qt6-base' 'qt6-svg' 'tokyocabinet' 'zlib')
makedepends=('cmake')
optdepends=('doxygen: Generate C++/Python API docs'
	          'cppunit: Build full test suite'
            'libxslt: Generate the user handbook')
source=("https://github.com/${pkgname}/regina/archive/regina-${pkgver}.tar.gz")
sha256sums=('aaa2e2f1b6b5c3a8dc9417ff3ad515efb104863c680ca2337029a81f72d2bfd0')

prepare() {
  cd "regina-regina-${pkgver}"

  sed -i '45 i #include <stdint.h>' engine/utilities/stringutils.h
  sed -i '44 i #include <stdint.h>' engine/triangulation/facepair.h
}

build() {
  cd "regina-regina-${pkgver}"

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "regina-regina-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
