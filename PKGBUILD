# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=fotoxx-test
pkgver=21.32
pkgrel=1
pkgdesc="A program for improving image files made with a digital camera, test version"
url="http://www.kornelix.net/fotoxx/fotoxx.html"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('dcraw' 'gtk3' 'libchamplain' 'perl-image-exiftool>=0.8.6' 'xdg-utils')
optdepends=('rawtherapee: for raw image processing'
	    'dvd+rw-tools: for burning CDs,DVDs or BlueRays'
	    'hugin: for panorama photos')
conflicts=('fotoxx')
provides=('fotoxx')
source=("http://www.kornelix.net/downloads/downloads/${pkgname%-test}-$pkgver-test.tar.gz" Makefile.patch)
sha256sums=('00d227fbd810b2d25c780a03dd00d06b72ef6963525e9258b7d0bf01a69cc8af'
            '91a603e77dc9836919fe4d12e89ca826330f8009cf726dd681a5e64ca42096a8')

prepare() {
  cd ${pkgname%-test}
  patch -Np1 < "$srcdir"/Makefile.patch
}

build() {
  cd ${pkgname%-test}
  make PREFIX=/usr
}

package() {
  cd ${pkgname%-test}
  make DESTDIR="$pkgdir" PREFIX=/usr ICONDIR=/usr/share/pixmaps install 
  
  sed -i 's+/usr/share/fotoxx/icons/++' "$pkgdir"/usr/share/applications/${pkgname%-test}.desktop
  sed -i 's+Icon=fotoxx.png+Icon=fotoxx+' "$pkgdir"/usr/share/applications/${pkgname%-test}.desktop
}
