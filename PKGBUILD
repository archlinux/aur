pkgname=vobcopy
pkgver=1.2.1
pkgrel=1
pkgdesc='Copies DVD .vob files to harddisk, decrypting them on the way'
arch=('i686' 'x86_64')
url="https://github.com/barak/vobcopy"
license=('GPL2')
depends=('libdvdread' 'libdvdcss')
options=('!docs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/barak/vobcopy/archive/refs/tags/$pkgver.tar.gz")
md5sums=('c088f6cb6fc8356c72ec6394d99cb867')

build() {
  cd "${srcdir}/${pkgname}-$pkgver"
  autoreconf --install --force --symlink
  ./configure
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" PREFIX=/usr/ MANDIR=/usr/share/man install
  mv "$pkgdir/usr/local/"* "$pkgdir/usr/"
  rmdir "$pkgdir/usr/local"
}

# vim:set ts=2 sw=2 et:
