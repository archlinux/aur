# Maintainer: Daniel Menelkir <dmenelkir at gmail dot com>

pkgname=libspectrum-git
pkgver=1.5.0.r29.ge85c934
pkgrel=1
epoch=1
pkgdesc="ZX Spectrum emulator support library."
arch=('i686' 'x86_64')
url="http://fuse-emulator.sourceforge.net/libspectrum.php"
license=("GPL")
conflicts=("libspectrum")
depends=('libgcrypt' 'glib2' 'audiofile')
source=("libspectrum::git+https://git.code.sf.net/p/fuse-emulator/libspectrum")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir"/libspectrum
  git describe --long --abbrev=7 | sed 's/^libspectrum-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir"/libspectrum
  ./autogen.sh
  ./configure --prefix=/usr --disable-static
  make
}

package() {
  cd "$srcdir"/libspectrum
  make DESTDIR="$pkgdir" install
}

