# Maintainer: Boris Timofeev <mashin87@gmail.com>
# Maintainer: Fabio Cavallo (FHorse) <punes.development@gmail.com>
pkgname=punes
pkgver=0.108
pkgrel=1
epoch=
pkgdesc="Nintendo Entertaiment System emulator"
arch=('i686' 'x86_64')
url="https://github.com/punesemu/puNES"
license=('GPL2')
groups=()
depends=('alsa-lib' 'desktop-file-utils' 'ffmpeg' 'hicolor-icon-theme' 'nvidia-cg-toolkit' 'libxrandr' 'qt5-base' 'qt5-svg')
makedepends=('cmake' 'glu' 'qt5-tools')
checkdepends=()
optdepends=()
provides=('punes')
conflicts=('punes-git')
replaces=()
backup=()
options=()
install=$pkgname.install
changelog=
source=("https://github.com/punesemu/puNES/archive/v$pkgver.tar.gz"
  "punes-0.108-Fixed-make-install.patch")
md5sums=('1845c9106b619883a84d9089ac917ed7'
  '24c9169a69413dca7cd35d3c655297ad')
noextract=()

#breaks internal lib7zip
options=('!buildflags')

prepare() {
  cd "$srcdir/puNES-$pkgver"
  patch -Np1 -i ../punes-0.108-Fixed-make-install.patch
  sed -e 's:^\tupdate-desktop-database.*$:\ttrue:' -i 'misc/Makefile.am'
}

build() {
  cd "$srcdir/puNES-$pkgver"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/puNES-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
