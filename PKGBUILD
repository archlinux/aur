# Maintainer: yugrotavele <yugrotavele at archlinux dot us>
# Contributor: Damir Perisa <damir@archlinux.org>

pkgname=dymo-cups-drivers
pkgver=1.2.0
pkgrel=1
url=http://global.dymo.com/
pkgdesc="Official Dymo supplied Linux Cups drivers for LabelWriter series"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL')
depends=('libcups')
#makedepends=('pkgconfig' 'perlxml' 'gnome-doc-utils' 'intltool')
#optdepends=('barcode' 'zint')
source=(${pkgname}-${pkgver}.tar.gz::http://global.dymo.com/img/compel/xKpID6d3hOi6UrMXDNF4k6IlSMSm3E_0.gz
        01-add-stddef.patch)
sha1sums=('1d8f5917029903f11b514ab3ce4b0f0f34592b39'
          '840aadc63377eace23d2006821f1cf3960abc9d0')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np1 -i "$srcdir/01-add-stddef.patch"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
