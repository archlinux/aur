# Maintainer: Sandy Carter <bwrsandman@gmail.com>
# PKGBUILD source: https://github.com/bwrsandman/pkgbuild/tree/master/openmw-git

pkgname=openmw-git
pkgver=0.43.0.5826.gdc82cb61f
pkgrel=1
pkgdesc="An open-source engine reimplementation for the role-playing game Morrowind."
arch=('i686' 'x86_64')
url="http://www.openmw.org"
license=('GPL3' 'MIT' 'custom')
depends=('openal' 'openscenegraph' 'mygui' 'bullet-multithreaded' 'qt5-base' 'ffmpeg' 'sdl2' 'unshield' 'libxt' 'boost-libs')
optdepends=('openscenegraph-openmw-git: experimental performance enhancements for OpenMW that are too controversial to be included in the general purpose OSG project')
makedepends=('git' 'cmake' 'boost')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=('git+https://gitlab.com/OpenMW/openmw.git')
sha1sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  git describe --always | sed 's|openmw-\([0-9]\+.[0-9]\+.[0-9]\+\)|\1|' | sed 's|-|.|g'
}

build() {
  cd "${srcdir}/${pkgname%-git}"
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=RelWithDebInfo \
        -DDESIRED_QT_VERSION=5
  make
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
