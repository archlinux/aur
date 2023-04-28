# Maintainer: Parker Reed <parker.l.reed@gmail.com>
# Contributor: Sven Klomp <mail@klomp.eu>
# Contributor: Mattheus Happe <mhappe@gmail.com>

pkgname=libconcord
_pkgsrcname=concordance
pkgver=1.5
pkgrel=1
pkgdesc='A library for programming Logitech(R) Harmony(TM) remote controls.'
arch=('i686' 'x86_64')
url='https://github.com/jaymzh/concordance/'
license=('GPL3')
depends=('curl' 'libusb-compat' 'libzip')
source=("https://github.com/jaymzh/$_pkgsrcname/releases/download/v$pkgver/$_pkgsrcname-$pkgver.tar.bz2")
sha256sums=('6e4ecfc18b91586cc0c58e376a7e23a561cbd7e8756586e62d5d9450e1b42b25')

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
