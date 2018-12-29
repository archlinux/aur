# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=fotoxx-test
_pkgvermaj=19.0
_pkgvermin=2018.12.27
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
source=("http://www.kornelix.net/downloads/tarballs/${pkgname%-test}-${_pkgvermaj}-test-${_pkgvermin//./-}.tar.gz")
sha512sums=('2b20d1cd34629ae993c6c89a37606a9387f4309cb9c7e9c16377ce4b44d57aa5923d48891e67e7cd8f807950a3bcd7ae7272780760d053a2f187f0093d57edf9')
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
