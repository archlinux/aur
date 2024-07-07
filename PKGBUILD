# Maintainer: Tricia, `creyon` <gtcreyon@gmail.com>
# Contributor: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=libtas
pkgver=1.4.6
pkgrel=1
pkgdesc="Tool-assisted speedrunning utility for Linux-native binaries"
arch=('x86_64')
url="https://github.com/clementgallet/libTAS"
license=('GPL-3.0-or-later')
depends=('alsa-lib' 'ffmpeg' 'fontconfig' 'freetype2' 'hicolor-icon-theme'
         'lua' 'qt5-base' 'sdl2' 'xcb-util-cursor' 'zlib')
optdepends=('lib32-libtas: for 32-bit games support')
source=("${url}/archive/v${pkgver}.tar.gz")
b2sums=('85f5fecc3d92c85372961208087d68782104e4c71ae06ffe4692dfbf1df0d103b4fc48e0a65388a9492aff66510d594a0a70aa306b464b4f1b4ed55289db8db8')

prepare() {
  cd libTAS-$pkgver

  for patch in ../*.patch; do
    if [ ! -f "$patch" ]; then
      break;
    else
      patch -p1 -i "$patch"
    fi
  done

  autoreconf -i
}

build() {
  cd "libTAS-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "libTAS-$pkgver"

  make DESTDIR="$pkgdir/" install
}
