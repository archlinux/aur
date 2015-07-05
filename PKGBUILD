# Contributor: Sven Klomp <mail@klomp.eu>
# Contributor: Mattheus Happe <mhappe@gmail.com>

pkgname=libconcord
_pkgsrcname=concordance
pkgver=1.2
pkgrel=1
pkgdesc='A library for programming Logitech(R) Harmony(TM) remote controls.'
arch=('i686' 'x86_64')
url='http://www.phildev.net/harmony/index.shtml'
license=('GPL3')
depends=('libusb-compat' 'libzip')
source=("http://downloads.sourceforge.net/project/$_pkgsrcname/$_pkgsrcname/$pkgver/$_pkgsrcname-$pkgver.tar.bz2")
sha256sums=('ce9f23dfcd9bb1de79edd07231062c5e5d5fdefb3dd88ae6da7fb25b8d782434')

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
