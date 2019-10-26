# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=fotoxx-test
_pkgvermaj=20.0
_pkgvermin=2019.10.26
pkgver=${_pkgvermaj}.${_pkgvermin}
pkgrel=1
pkgdesc="A program for improving image files made with a digital camera, test-version"
url="http://www.kornelix.net/fotoxx/fotoxx.html"
arch=('i686' 'x86_64')
license=('GPL3')
conflicts=('fotoxx')
provides=('fotoxx')
depends=('libraw' 'gtk3' 'libchamplain' 'perl-image-exiftool>=0.8.6' 'xdg-utils')
optdepends=('rawtherapee: for raw image processing'
	    'dvd+rw-tools: for burning CDs,DVDs or BlueRays'
	    'hugin: for panorama photos')
source=("http://kornelix.net/downloads/downloads/${pkgname%-test}-${_pkgvermaj}-test-${_pkgvermin//./-}.tar.gz")
sha256sums=('61f9993220a2d6cdb981d0f4e0e8ccc0c634dcdc935a899cbd659f15cbbe8507')
options=('!makeflags')

build() {
  cd ${pkgname%-test}
  make clean
  make PREFIX=/usr
}

package() {
  cd ${pkgname%-test}
  make DESTDIR="$pkgdir" PREFIX=/usr install
  rm -r "$pkgdir"/usr/share/appdata
}
