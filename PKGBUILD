# Maintainer: Alex Brinister <IrVQ55Gw9TZ7BW8e at tuta dot io>
# Contributor: Kingan <kingan201 at gmail dot com> 
# Contributor: Frederic Bezies <fredbezies at gmail dot com> 
# Contributor: Valsu [arch(at)hylia.de]

pkgname=prboom-plus
pkgver=2.6um
pkgrel=1
pkgdesc='An advanced, Vanilla-compatible Doom engine based on PrBoom'
url='http://prboom-plus.sourceforge.net/'
arch=('x86_64')
license=('GPL2')
depends=('fluidsynth' 'glu' 'libmad' 'portmidi' 'sdl_image' 'sdl_mixer' 'sdl_net')
makedepends=('cmake')
conflicts=('prboom-plus-svn')
source=("https://github.com/coelckers/prboom-plus/archive/refs/tags/v$pkgver.tar.gz")
sha1sums=('cd56bf4751fd48ee2a703d8f99b000925bd6af38')

_rootdir="prboom-plus-${pkgver}/prboom2"
_builddir="${_rootdir}/cbuild"

prepare() {
  cd "${srcdir}"  
  sed -i -E 's/mktemp/mkstemp/g' $(find "${_rootdir}" -type f -name r_demo.c)
}

build() {
  cd "${srcdir}"

  mkdir -p "${_builddir}"
  cd "${_builddir}"

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ../
  make
}

package() {
  cd "${srcdir}/${_builddir}"

  make DESTDIR="${pkgdir}" gamesdir=/usr/bin install
}
