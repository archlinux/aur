# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=hugin-hg
pkgver=7184.d888313bfc31
pkgrel=1
pkgdesc="A frontend to the panorama-tools"
arch=('i686' 'x86_64')
url="http://hugin.sourceforge.net/"
license=('GPL')
depends=('openexr' 'exiv2' 'wxgtk' 'boost-libs' 'libpano13>=2.9.19' 'python2' \
         'lensfun' 'glew' 'enblend-enfuse' 'perl-exiftool' 'desktop-file-utils')
makedepends=('mercurial' 'cmake' 'boost' 'swig')
optdepends=('autopano-sift-c: automatic control point generator (obsolete)')
provides=('hugin')
conflicts=('hugin')
install=hugin.install
source=('hg+http://hg.code.sf.net/p/hugin/hugin')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/hugin"
  echo $(hg identify -n).$(hg identify -i)
}

build() {
  mkdir -p "$srcdir/build"
  cd "$srcdir/build"

  cmake "$srcdir/hugin" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_HSI=ON \
    -DCMAKE_SHARED_LINKER_FLAGS="-lpthread"
  make
}

package() {
  cd "$srcdir/build"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
