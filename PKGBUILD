# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=fotoxx-test
_pkgvermaj=19.0
_pkgvermin=2018.12.26
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
sha512sums=('8735ecb83d0ad2deb00b4399959f5f8b6a57ee0c4f643dc7318f3263ba30b4548bb035e760740c4799ee9b3c5dac7be7cde3afc97e1b036b85566b6680a0f2e4')
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
