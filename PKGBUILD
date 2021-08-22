# $Id$
# Maintainer: BangL <contact through AUR please>
pkgname=openra-kang
pkgver=20210822.g7bbfe86d7kang
pkgrel=1
pkgdesc="An open-source implementation of the Red Alert engine using .NET/Mono and OpenGL, Kang Version. (Warning: Upstream Unmaintained since 2017)"
arch=('any')
url="https://github.com/BangL/OpenRA"
license=('GPL3')
install=openra.install
depends=('mono' 'ttf-dejavu' 'openal' 'libgl' 'freetype2' 'sdl2' 'lua51' 'hicolor-icon-theme' 'gtk-update-icon-cache'
         'desktop-file-utils' 'xdg-utils' 'zenity')
makedepends=('git' 'unzip')
provides=('openra')
conflicts=('openra')
options=(!strip)

source=("$pkgname"::"git+$url.git#branch=bleed")
md5sums=('SKIP')


pkgver() {
  cd "$srcdir"/"$pkgname"

  DATE="$(date +%Y%m%d)"
  PV=$(git name-rev --name-only --tags --no-undefined HEAD 2>/dev/null || echo git-`git rev-parse --short HEAD`kang) ### get GIT version
  echo "$DATE"$PV | sed -e 's/git-/.g/g' 

}

build() {
  cd "$srcdir"/"$pkgname"

#  make version
#  make dependencies
#  make core
#  make tools

make all DEBUG=false TARGETPLATFORM=unix-generic  

}

package() {
  cd "$srcdir"/"$pkgname"

#  make prefix=/usr DESTDIR="$pkgdir" install-all
#  make prefix=/usr DESTDIR="$pkgdir" install-linux-shortcuts
#  make prefix=/usr DESTDIR="$pkgdir" install-linux-mime
#  make prefix=/usr DESTDIR="$pkgdir" install-linux-appdata

  make prefix=/usr DESTDIR="$pkgdir" install DEBUG=false
  make prefix=/usr DESTDIR="$pkgdir" install-linux-shortcuts DEBUG=false
  make prefix=/usr DESTDIR="$pkgdir" install-linux-appdata DEBUG=false
}
