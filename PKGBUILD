# Based on the avogadro PKGBUILD in [extra]
_pkgname=avogadro
pkgname=avogadro-git
pkgver=1425272470
pkgrel=1
pkgdesc="An advanced molecular editor based on Qt"
arch=('i686' 'x86_64')
url="http://avogadro.cc/wiki/Main_Page"
license=('GPL2')
depends=('eigen2' 'openbabel' 'python2-pyqt' 'boost-libs' 'glew' 'python2-numpy')
makedepends=('cmake' 'boost' 'doxygen' 'libgl')
conflicts=('avogadro')
provides=('avogadro')

source=(
  'git://github.com/cryos/avogadro.git'
  'boost153.patch'
)
sha512sums=(
'SKIP'            'b8ebad1e70a91408be97554ac4af5872ca9ce62a387568ed32c40c50f0b29b3f6c3db38333408fda119b08f99531fd87e4dec6a5483e3492a1e8fe30b4e42d26'
)

pkgver() {
  cd -- "$srcdir/$_pkgname"
  git log -n1 --pretty=format:%ct
}

prepare() {
  cd "$srcdir/$_pkgname"
  patch -p1 -i "$srcdir"/boost153.patch
}

build() {
  cd "$srcdir/$_pkgname"
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DPYTHON_EXECUTABLE=/usr/bin/python2 \
    -DQT_MKSPECS_RELATIVE=share/qt4/mkspecs
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
