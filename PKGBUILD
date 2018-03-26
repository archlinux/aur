# Maintainer:  Gabriel Souza Franco <Z2FicmllbGZyYW5jb3NvdXphQGdtYWlsLmNvbQ==>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Martin C. Doege <mdoege at compuserve dot com>
# Contributor: kotyz <kotyz.king@gmail.com>

pkgname=lib32-tkimg
pkgver=1.4.7
pkgrel=1
pkgdesc="This package enhances Tk, adding support for many other Image formats: BMP, XBM, XPM, GIF, PNG, JPEG, TIFF and postscript. (32-bit)"
url="http://tkimg.sourceforge.net"
arch=('x86_64')
license=('BSD')
depends=('lib32-zlib' 'lib32-libjpeg' 'lib32-libpng' 'lib32-libtiff' 'lib32-tcl' 'lib32-tk' 'tcllib')
source=(http://downloads.sourceforge.net/tkimg/${pkgver%.*}/Img-Source-$pkgver.tar.gz)
sha1sums=('c8131096488f42fbb143aee41e3b4878eaa17397')

build() {
  cd "$srcdir/Img-Source-$pkgver"

  export CC='gcc -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure --prefix=/usr --libdir=/usr/lib32
  make
}

package() {
  cd "$srcdir/Img-Source-$pkgver"

  make INSTALL_ROOT="$pkgdir" install
  rm -rf "$pkgdir/usr/"{include,share}
}
