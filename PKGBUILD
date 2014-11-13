# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: Rasi <rasi@xssn.at>
# Contributor: Sean Pringle <sean.pringle@gmail.com>
# Contributor: SanskritFritz (gmail)

pkgname=rofi-git
_gitname=rofi
pkgver=r414.c549c4f
pkgrel=1
pkgdesc="Popup window switcher roughly based on superswitcher, requiring only xlib and xft. DaveDavenport's fork"
arch=('i686' 'x86_64')
url="https://davedavenport.github.io/rofi/"
license=('MIT')
depends=('libx11' 'libxft' 'freetype2' 'libxdg-basedir' 'libxinerama')
optdepends=('i3-wm: use as a window switcher')
makedepends=('autoconf' 'git')
provides=('rofi')
conflicts=('rofi')
source=("git+https://github.com/DaveDavenport/rofi")
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_gitname"
  autoreconf --install
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname"
  make install DESTDIR="$pkgdir"
}
