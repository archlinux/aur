# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=fotoxx
_pkgvermaj=19.0
_pkgvermin=2018.12.22
pkgver=${_pkgvermaj}.${_pkgvermin}
pkgrel=1
pkgdesc="A program for improving image files made with a digital camera"
url="http://www.kornelix.net/fotoxx/fotoxx.html"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('libraw' 'gtk3' 'libchamplain' 'perl-image-exiftool>=0.8.6' 'xdg-utils')
optdepends=('rawtherapee: for raw image processing'
	    'dvd+rw-tools: for burning CDs,DVDs or BlueRays'
	    'hugin: for panorama photos')
source=("http://www.kornelix.net/downloads/tarballs/$pkgname-${_pkgvermaj}-test-${_pkgvermin//./-}.tar.gz")
sha512sums=('72879368be408c74cef8fe91f0f6fa90dce9e70a9fdd167bbe99c080b97c7685cf96b963c669353b861c60faddf861e0d18b0c37036025ff6eac612157674144')
options=('!makeflags')

build() {
  cd $pkgname
  make clean
  make PREFIX=/usr
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" PREFIX=/usr install
  rm -r "$pkgdir"/usr/share/appdata
}
