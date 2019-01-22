# Maintainer: Kujiu <kujiu+arch@kujiu.org>

pkgname=printer-driver-indexbraille-git
pkgrel=1
pkgver=r125.2995b05
pkgdesc='CUPS filter/driver for Index Braille Embossers. Includes support for Index-direct-Braille (idB)'
arch=('i686' 'x86_64')
url='https://www.indexbraille.com'
license=('GPL2')
depends=('glibc' 'cups' 'libcups')
makedepends=('git' 'autoconf' 'automake' 'gcc')
conflicts=('printer-driver-indexbraille')

source=("git+https://github.com/IndexBraille/linux-driver.git#branch=master")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/linux-driver"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/linux-driver"
  autoreconf --install
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/linux-driver"
  make DESTDIR="$pkgdir" install
}
