# Maintainer: Ian D. Scott <ian@perebruin.com>
# Contributor: Lari Tikkanen <lartza@wippies.com>

pkgname=warzone2100-git
_gitname=warzone2100
pkgver=r13131.6d6ee05
pkgrel=1
pkgdesc="3D realtime strategy game on a future Earth (Git version)"
arch=('i686' 'x86_64')
url="http://wz2100.net/"
license=('GPL')
depends=('qt5-script' 'sdl2' 'libtheora' 'openal' 'libvorbis' 'physfs' 'quesoglc' 'ttf-dejavu')
makedepends=('zip' 'unzip' 'git')
provides=('warzone' 'warzone2100' 'warzone-svn' 'warzone2100-beta')
conflicts=('warzone2100')
source=('git://github.com/Warzone2100/warzone2100.git')
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_gitname"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir" install
}
