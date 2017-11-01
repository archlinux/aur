# $$
# Maintainer: Eden Rose  <eenov1988 (at) gmail.com>
# Contributor: Ian D. Scott <ian@perebruin.com>
# Contributor: Lari Tikkanen <lartza@wippies.com>

pkgname=warzone2100-optimized-git
_gitname=warzone2100
pkgver=r13674.1cdd7bdb9
pkgrel=1
pkgdesc="3D realtime strategy game on a future Earth (Git version)"
arch=('i686' 'x86_64')
url="http://wz2100.net/"
license=('GPL')
depends=('qt5-script' 'sdl2' 'libtheora' 'openal' 'libvorbis' 'physfs' 'quesoglc' 'ttf-dejavu')
makedepends=('zip' 'unzip' 'git')
provides=('warzone' 'warzone2100' 'warzone2100-git' "$PKGNAME" 'warzone-svn' 'warzone2100-beta')
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
  ./configure --prefix=/usr --enable-debug=relaxed --with-backend=qt
  #find . -type f -iname "Makefile" -print0 | while IFS= read -r -d $'\0' line; do
  #cat $line | sed 's/-Werror/-O3/g'
  #done
  cd "$srcdir/$_gitname"
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir" install
}
