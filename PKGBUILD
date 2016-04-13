# Maintainer: Vaporeon <vaporeon@tfwno.gf>
pkgname=punes-git
pkgver=r734.d63ba71
pkgrel=1
pkgdesc="Nintendo Entertaiment System emulator"
arch=('i686' 'x86_64')
url="http://forums.nesdev.com/viewtopic.php?t=6928"
license=('GPL2')
depends=('sdl' 'qt5-base' 'alsa-lib' 'hicolor-icon-theme' 'desktop-file-utils' 'nvidia-cg-toolkit')
makedepends=('autoconf-archive')
conflicts=('punes')
provides=('punes')
install=$pkgname.install
source=("git+https://github.com/punesemu/puNES.git")
md5sums=('SKIP')

pkgver() {
  cd puNES
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/puNES"
  ./autogen.sh
  ./configure --enable-qt5 --prefix=/usr
  make
}

package() {
  cd "$srcdir/puNES"
  make DESTDIR="$pkgdir" install
}
