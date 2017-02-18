# $Id$
# Maintainer: BangL <contact through AUR please>
pkgname=openra-kang
pkgver=kang.ebc8c62
pkgrel=1
pkgdesc="An open-source implementation of the Red Alert engine using .NET/Mono and OpenGL"
arch=('any')
url="http://www.openra.net"
license=('GPL3')
install=openra.install
depends=('mono' 'ttf-dejavu' 'openal' 'libgl' 'freetype2' 'sdl2' 'lua51' 'hicolor-icon-theme' 'gtk-update-icon-cache'
         'desktop-file-utils' 'xdg-utils' 'zenity')
makedepends=('git' 'unzip')
provides=('openra')
conflicts=('openra')
options=(!strip)

source=('OpenRA::git://github.com/BangL/OpenRA.git#branch=bleed')
md5sums=('SKIP')


pkgver() {
  cd "$srcdir/OpenRA"

  PV=$(git name-rev --name-only --tags --no-undefined HEAD 2>/dev/null || echo kang.`git rev-parse --short HEAD`)
  echo $PV
}

build() {
  cd OpenRA

  make version
  make dependencies
  make core
  make tools
}

package() {
  cd OpenRA

  make prefix=/usr DESTDIR="$pkgdir" install-all
  make prefix=/usr DESTDIR="$pkgdir" install-linux-shortcuts
  make prefix=/usr DESTDIR="$pkgdir" install-linux-mime
  make prefix=/usr DESTDIR="$pkgdir" install-linux-appdata
}
