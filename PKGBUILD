# Maintainer:  VirtualTam <virtualtam@flibidi.net>
# Contributor: Eugene Yudin aka Infy <Eugene dot Yudin at gmail dot com>
pkgname=goldendict-qt5-git
pkgver=1.5.0.RC2.49.gf1a7dc5
pkgrel=1
pkgdesc="Feature-rich dictionary lookup program."
arch=('i686' 'x86_64')
url="http://goldendict.org/"
license=('GPL3')
depends=('ffmpeg' 'hunspell' 'libao' 'libeb'
         'qt5-svg' 'qt5-tools' 'qt5-webkit' 'qt5-x11extras')
makedepends=('git')
conflicts=('goldendict' 'goldendict-svn' 'goldendict-git-opt')
provides=('goldendict')
replaces=('goldendict' 'goldendict-svn' 'goldendict-git-opt')
_gitname="goldendict"
source=(git://github.com/goldendict/goldendict.git)
sha256sums=(SKIP)

pkgver() {
  cd ${_gitname}
  git describe --always --tags | sed 's|-|.|g'
}

prepare() {
  cd ${_gitname}
  msg "Fixing flags"
  echo "QMAKE_CXXFLAGS_RELEASE = $CFLAGS" >> goldendict.pro
  echo "QMAKE_CFLAGS_RELEASE = $CXXFLAGS" >> goldendict.pro
}

build(){
  cd ${_gitname}
  PREFIX="/usr" qmake-qt5
  make
}

package() {
  cd ${_gitname}
  make INSTALL_ROOT="${pkgdir}" install
}
