# Maintainer: Graham Edgecombe <graham@grahamedgecombe.com>
pkgname=openrct2
pkgver=0.0.6
pkgrel=1
pkgdesc='Open source re-implementation of Roller Coaster Tycoon 2 (requires full
         copy of the game)'
arch=('i686' 'x86_64')
url='https://openrct2.website'
license=('GPL3')
depends=('hicolor-icon-theme' 'sdl2' 'sdl2_ttf' 'curl' 'jansson' 'speexdsp'
         'fontconfig' 'libpng' 'openssl' 'libzip')
makedepends=('cmake')
optdepends=('zenity: System dialog box support (GNOME/GTK)'
            'kdialog: System dialog box support (KDE)'
            'alsa-lib: ALSA audio driver'
            'libpulse: PulseAudio audio driver')
install=openrct2.install
source=('https://github.com/OpenRCT2/OpenRCT2/archive/v0.0.6.tar.gz')
sha256sums=('c4e04359ef91bedf58fbd9da57c39ba59066840a467aa0346c4a6353b0ae33f5')

build() {
  cd "$srcdir/OpenRCT2-$pkgver"

  mkdir -p build
  cd build
  cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_INSTALL_PREFIX=/usr ..
  make all g2
}

package() {
  cd "$srcdir/OpenRCT2-$pkgver/build"

  make DESTDIR="$pkgdir" install
}
