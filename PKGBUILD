# Maintainer: Gerhard Stein <gerstrong@steinzone.de>
# Contributor: Peter Lewis <plewis@aur.archlinux.org>
pkgname=commander-genius-git
_pkgname=Commander-Genius
pkgver=v2.8.3.r1.g279fb3cd6
pkgrel=1
pkgdesc="A modern implementation of the classic Commander Keen game series"
arch=('i686' 'x86_64')
url="http://clonekeenplus.sourceforge.net"
license=('GPL')
groups=()
depends=('sdl2' 'mesa' 'sdl2_image' 'sdl2_ttf' 'sdl2_mixer')
makedepends=('git' 'cmake' 'glu')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(git+https://gitlab.com/Dringgstein/Commander-Genius.git)
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  echo $(git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g')
}


build() {
  mkdir -p "$srcdir/$_pkgname-build"
  cd "$srcdir/$_pkgname"
  sed -i 's/APPDIR\ games/APPDIR\ bin/' ./src/install.cmake
  cd "$srcdir/$_pkgname-build"
  
  cmake -S "$srcdir/$_pkgname" -B "$srcdir/$_pkgname-build" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DUSE_BOOST=no

  make
}

package() {
  cd "$srcdir/$_pkgname-build"
  make DESTDIR="$pkgdir/" install
#  mkdir -p "$pkgdir/usr/share/icons"
#  ln -s $pkgdir/usr/share/games/commandergenius/CGLogo.svg $pkgdir/usr/share/icons/cg.svg
#  mkdir -p "$pkgdir/usr/bin"
   #test -f "$pkgdir/usr/games/CGeniusExe" && mv "$pkgdir/usr/games/CGeniusExe" "$pkgdir/usr/bin/CGeniusExe"
}
