# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=fotoxx-test
pkgver=21.26
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
sha512sums=('0f3a58eb3ab45fbcdfeb75dfe24a18473e433d2de938c1849cf5ff9d3e2d778368eefddb45fe4631d14d377c6d9bd05d9e3b8384fc9fb47705d448e485b5f276')

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
