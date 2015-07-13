# Maintainer:  VirtualTam <virtualtam@flibidi.net>
# Contributor: Eugene Yudin aka Infy <Eugene dot Yudin at gmail dot com>
pkgname=goldendict-git
pkgver=1.5.0.RC.487.g043a10c
pkgrel=1
pkgdesc="Feature-rich dictionary lookup program."
arch=('i686' 'x86_64')
url="http://goldendict.org/"
license=('GPL3')
depends=('ffmpeg' 'hunspell' 'libao' 'libeb' 'libvorbis' 'libxtst' 'lzo2' 'qt4' 'qtwebkit' 'zlib')
makedepends=('git')
conflicts=('goldendict' 'goldendict-svn' 'goldendict-git-opt')
provides=('goldendict')
replaces=('goldendict' 'goldendict-svn' 'goldendict-git-opt')
_gitname="goldendict"
source=(git://github.com/goldendict/goldendict.git)
sha256sums=(SKIP)

pkgver() {
  cd ${_gitname}
  git describe --always | sed 's|-|.|g'
}

prepare() {
  cd ${_gitname}
  msg "Fixing flags"
  echo "QMAKE_CXXFLAGS_RELEASE = $CFLAGS" >> goldendict.pro
  echo "QMAKE_CFLAGS_RELEASE = $CXXFLAGS" >> goldendict.pro
}

build(){
  cd ${_gitname}
  PREFIX="/usr" qmake-qt4
  make
}

package() {
  cd ${_gitname}
  make INSTALL_ROOT="${pkgdir}" install
}
