# Maintainer: Graham Edgecombe <graham@grahamedgecombe.com>
pkgname=openrct2
pkgver=0.1.0
pkgrel=1
pkgdesc='Open source re-implementation of Roller Coaster Tycoon 2 (requires full
         copy of the game)'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
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
source=("https://github.com/OpenRCT2/OpenRCT2/archive/v$pkgver.tar.gz")
sha256sums=('0347a47d380fc18ea543928c92a13d1bdb4431573154afeb80fa33f1149e6992')

build() {
  cd "$srcdir/OpenRCT2-$pkgver"

  mkdir -p build
  cd build
  cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_INSTALL_PREFIX=/usr \
    -DWITH_TESTS=on -DDISABLE_RCT2_TESTS=on ..
  make all g2
}

check() {
  cd "$srcdir/OpenRCT2-$pkgver/build"

  make test
}

package() {
  cd "$srcdir/OpenRCT2-$pkgver/build"

  make DESTDIR="$pkgdir" install
}
