# Contributor: Sven Klomp <mail@klomp.eu>
# Contributor: Mattheus Happe <mhappe@gmail.com>

pkgname=libconcord
_pkgsrcname=concordance
pkgver=1.3
pkgrel=1
pkgdesc='A library for programming Logitech(R) Harmony(TM) remote controls.'
arch=('i686' 'x86_64')
url='http://www.phildev.net/harmony/index.shtml'
license=('GPL3')
depends=('libusb-compat' 'libzip')
source=("https://github.com/jaymzh/$_pkgsrcname/releases/download/v$pkgver/$_pkgsrcname-$pkgver.tar.bz2")
sha256sums=('bd0d1a7cc3aca0276cc02ee1bc7cf30b44f0b84a5edcac862844b83f789ccb8a')

build() { 
  cd "$srcdir/$_pkgsrcname-$pkgver/libconcord"
  ./configure --prefix=/usr --enable-force-libusb-on-linux
  make
  make udev
}

package() {
  cd "$srcdir/$_pkgsrcname-$pkgver/libconcord"
  make DESTDIR="$pkgdir" install
  make -j1 DESTDIR="$pkgdir/usr" install_udev
}

# vim:set ts=2 sw=2 et:
