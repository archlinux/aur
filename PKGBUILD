# Maintainer: Ian D. Scott <ian@perebruin.com>
# Contributor: Lari Tikkanen <lartza@wippies.com>

pkgname=warzone2100-git
_gitname=warzone2100
pkgver=master.SDL.r4032.g9cc1d33
pkgrel=1
pkgdesc="3D realtime strategy game on a future Earth (Git version)"
arch=('i686' 'x86_64')
url="http://wz2100.net/"
license=('GPL')
depends=('gettext' 'qt4' 'libtheora' 'openal' 'libvorbis' 'glew' 'physfs' 'quesoglc' 'ttf-dejavu')
makedepends=('zip' 'unzip')
provides=('warzone' 'warzone2100' 'warzone-svn' 'warzone2100-beta')
conflicts=('warzone2100')
source=('git://github.com/Warzone2100/warzone2100.git')
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_gitname"
  ./autogen.sh
  CCFLAGS= CXXFLAGS= ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir" install
}
