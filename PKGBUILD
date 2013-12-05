# Maintainer: Sandy Carter <bwrsandman@gmail.com>
# PKGBUILD source: https://github.com/bwrsandman/pkgbuild/tree/master/openmw-git

pkgname=openmw-git
pkgver=0.27.262.g07f692b
pkgrel=2
pkgdesc="An open-source engine reimplementation for the role-playing game Morrowind."
arch=('i686' 'x86_64')
url="http://www.openmw.org"
license=('GPL3' 'MIT' 'custom')

depends=('openal' 'ogre' 'mygui' 'bullet' 'qt4' 'ffmpeg' 'sdl2' 'unshield')
makedepends=('git' 'cmake' 'boost')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")

source=('git://github.com/zinnschlag/openmw.git')
sha1sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  git describe --always | sed 's|openmw-\([0-9]\+.[0-9]\+\).0|\1|' | sed 's|-|.|g'
}

build() {
  cd "${srcdir}/${pkgname%-git}"
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=RelWithDebInfo \
        -DQT_QMAKE_EXECUTABLE=/usr/bin/qmake-qt4 
  make
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
