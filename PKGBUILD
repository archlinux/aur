# Maintainer: cassfalg <cassfalg-git@gmx.de>
# Contributor: Christian Bühler <christian@cbuehler.de>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Elmo Todurov <todurov@gmail.com>
# Contributor: guini <sidtrun@googlemail.com>
# Contributor: Forrest Loomis <cybercyst _ at _ gmail dot com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: fana-m <geminin@gmx.net>

pkgname=freeorion-git
pkgver=r8845.a777581
pkgrel=1
pkgdesc="Free Clone of Master of Orion."
url="http://www.freeorion.org/index.php/Main_Page"
arch=('i686' 'x86_64')
license=('GPL')
depends=('boost' 'ogre' 'bullet' 'python2' 'sdl2' 'freealut' 'graphviz' 'libvorbis' 'libogg' 'glew')
makedepends=('git' 'cmake')
provides=('freeorion')
conflicts=('freeorion')
install=freeorion.install
source=("freeorion.git::git+https://github.com/freeorion/freeorion.git#branch=master"
        freeorion.install
        getversion.py
        )
md5sums=('SKIP'
         'e88e49fbe0f638775f6be9bbc824e070'
         '5fdadcc589bc4887fcf1684923226867')


pkgver() {
  cd freeorion.git
  python ../getversion.py
}

prepare() {
  true #just to have a statement to execute...
#  cd "$srcdir/freeorion.git"
#  patch < ../../remove_oisinput.patch
}

build() {
  mkdir -p "$srcdir/FreeOrion-build"
  cd "$srcdir/FreeOrion-build"
  cmake -DCMAKE_INSTALL_PREFIX=/usr ../freeorion.git
  make
}

package() {
  cd "$srcdir/FreeOrion-build"
  make DESTDIR=$pkgdir install
}

# vim:set ts=2 sw=2 et:
