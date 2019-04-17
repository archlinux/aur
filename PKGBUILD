# Maintainer: JP Cimalando <jp-dev inbox.ru>
pkgname=adljack
pkgver=1.2.0
pkgrel=1
epoch=
pkgdesc="OPL3/OPN2 synthesizer using ADLMIDI, for Jack and cross-platform audio"
arch=('i686' 'x86_64')
url="https://github.com/jpcima/adljack"
license=('custom' 'GPL' 'LGPL')
groups=()
depends=('jack' 'alsa-lib' 'libpulse' 'liblo' 'sdl2')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/jpcima/adljack/releases/download/v$pkgver/adljack-$pkgver.tar.gz")
md5sums=('e928468d7b369f38b71bcedc5e6b7cfd')
noextract=()
validpgpkeys=()

build() {
  cd "$pkgname-$pkgver"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DPREFER_PDCURSES=ON ..
  make
}

package() {
  cd "$pkgname-$pkgver"
  install -D -m 644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
  cd build
  make DESTDIR="$pkgdir/" install
}
