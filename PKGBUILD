# Maintainer: Sandy Carter <bwrsandman@gmail.com>
# PKGBUILD source: https://github.com/bwrsandman/pkgbuild/tree/master/openmw-git

pkgname=openmw-git
_gitname="openmw"
pkgver=0.25.322.g0481e64
pkgrel=1
pkgdesc="An open-source engine reimplementation for the role-playing game Morrowind."
arch=('i686' 'x86_64')
url="http://www.openmw.org"
license=('GPL3' 'custom')

depends=('openal' 'ogre' 'mygui' 'bullet' 'mpg123' 'libsndfile' 'qt4' 'ffmpeg' 'sdl2')
makedepends=('git' 'cmake' 'boost')
conflicts=('openmw')
provides=('openmw')

source=('git://github.com/zinnschlag/openmw.git')
sha1sums=('SKIP')

pkgver() {
    cd "$srcdir/$_gitname"
    git describe --always | sed 's|openmw-\([0-9]\+.[0-9]\+\).0|\1|' | sed 's|-|.|g'
}

build() {
  cd "${srcdir}/${_gitname}"
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=RelWithDebInfo \
        -DQT_QMAKE_EXECUTABLE=/usr/bin/qmake-qt4
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
