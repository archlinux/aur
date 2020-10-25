# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=fotoxx-test
pkgver=21.25
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
source=("http://www.kornelix.net/downloads/downloads/${pkgname%-test}-$pkgver-test.tar.gz")
sha512sums=('fe94c8e45b9a61095f180046dac802231284d01aa8c545a72d2fb1d04f5b7b9e3ba014c7fd485c56a0354380c90714d6e682717b06c65afb7c52acc9a7b7d995')

prepare() {
  cd ${pkgname%-test}
  sed -i 's+libchamplain+champlain+g' Makefile
  chmod o+r images/color-mode.jpg
}

build() {
    cd ${pkgname%-test}
  make PREFIX=/usr
}

package() {
  cd ${pkgname%-test}
  make DESTDIR="$pkgdir" PREFIX=/usr ICONDIR=/usr/share/pixmaps install 
  rm -r "$pkgdir"/usr/share/appdata
  sed -i 's+/usr/share/fotoxx/icons/++' "$pkgdir"/usr/share/applications/${pkgname%-test}.desktop
  sed -i 's+Icon=fotoxx.png+Icon=fotoxx+' "$pkgdir"/usr/share/applications/${pkgname%-test}.desktop
}
