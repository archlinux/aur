# Maintainer: JP Cimalando <jp-dev inbox.ru>
pkgname=adljack
pkgver=1.0.0
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
source=("https://github.com/jpcima/adljack/files/1995071/$pkgname-$pkgver.tar.gz")
md5sums=('3ec1892386358fe7e1f76c667ae42e20')
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
