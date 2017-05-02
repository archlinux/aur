# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=fotoxx
pkgver=17.04.2
pkgrel=1
pkgdesc="A program for improving image files made with a digital camera"
url="http://www.kornelix.net/fotoxx/fotoxx.html"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('libraw' 'gtk3' 'libchamplain' 'perl-image-exiftool>=0.8.6' 'xdg-utils')
optdepends=('mashup: for composing pages to print from within fotoxx' 
	    'rawtherapee: for raw image processing'
	    'dvd+rw-tools: for burning CDs,DVDs or BlueRays'
	    'hugin: for panorama photos')
source=("http://www.kornelix.net/downloads/tarballs/$pkgname-$pkgver.tar.gz" 'no_leafpad.patch')
sha512sums=('f66821418ca10199b72a1634463d61ce18f25b0951226ee94ceaf75c88b6d214006a5d0b5d6962264740e01a92af31f7187bd97b05f28cd14126c2b8bd7eef1c'
            '112315f2d940a562548dc16e0b553c7aae485e2bbd3cf015c5f866fa79a7a47b36dd3fa1c2a5f73df1f4aa4e125832249ca7f17dba2586123f5b1093b18f3787')
options=('!makeflags')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 < "$srcdir"/no_leafpad.patch || true
}

build() {
  cd $pkgname-$pkgver
  CXX=g++ make PREFIX=/usr
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR=$pkgdir PREFIX=/usr install
  rm -r "$pkgdir"/usr/share/appdata
}
