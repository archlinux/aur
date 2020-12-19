# Maintainer: Vaporeon <vaporeon@vaporeon.io>
pkgname=punes-git
pkgver=r1199.83ab85c5
pkgrel=1
pkgdesc="Nintendo Entertaiment System emulator"
arch=('x86_64')
url="http://forums.nesdev.com/viewtopic.php?t=6928"
license=('GPL2')
depends=('alsa-lib' 'desktop-file-utils' 'ffmpeg' 'hicolor-icon-theme' 'nvidia-cg-toolkit' 'qt5-base' 'qt5-svg')
makedepends=('automake' 'git' 'qt5-tools')
conflicts=('punes')
provides=('punes')
source=("git+https://github.com/punesemu/puNES.git")
md5sums=('SKIP')

pkgver() {
  cd puNES
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/puNES"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/puNES"
  make DESTDIR="$pkgdir" install
  #idk what the deal with this mimeinfo cache is, it seems to come and go
  rm -f "$pkgdir"/usr/share/applications/mimeinfo.cache
}
