# Maintainer:  VirtualTam <virtualtam@flibidi.net>
# Contributor: Renato Budinich <rennabh@gmail.com>
pkgname=freewheeling-svn
_pkgname=freewheeling
pkgver=0.6.1.r100
pkgrel=1
pkgdesc="Live looping instrument that returns us to the joy of making music spontaneously."
arch=('x86_64' 'i686')
url="http://freewheeling.sourceforge.net"
license=('GPL2')
depends=('fluidsynth' 'freetype2' 'jack2'
         'libogg' 'libsm' 'libsndfile' 'libvorbis' 'libxml2'
         'openssl' 'sdl' 'sdl_ttf' 'sdl_gfx')
makedepends=('autoconf' 'automake' 'subversion')
conflicts=('freewheeling')
source=("${_pkgname}::svn+http://svn.code.sf.net/p/${_pkgname}/code/"
        "libraries.patch")
sha256sums=('SKIP'
            'fe2b03a306d5b896e6cc87a33fcf98d3d4a118d1ac2474d956c4d392651a7fb2')

pkgver() {
  cd ${_pkgname}
  local ver="$(svnversion)"
  printf "0.6.1.r%s" "${ver//[[:alpha:]]}"
}

prepare() {
  cd ${_pkgname}
  patch -p1 -i ../${source[1]}
}

build() {
  cd ${_pkgname}
  aclocal
  autoconf
  autoheader || true
  automake -a
  ./configure --prefix="/usr"
  make
}

package() {
  cd ${_pkgname}
  make DESTDIR="${pkgdir}" install
}
