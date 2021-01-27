# Maintainer:  Gabriel Souza Franco <Z2FicmllbGZyYW5jb3NvdXphQGdtYWlsLmNvbQ==>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Martin C. Doege <mdoege at compuserve dot com>
# Contributor: kotyz <kotyz.king@gmail.com>

pkgname=lib32-tkimg
pkgver=1.4.13
pkgrel=1
pkgdesc='Provides the handling of several image formats beyond the standard formats in Tk (32-bit)'
url='https://wiki.tcl-lang.org/page/Img'
arch=('x86_64')
license=('BSD')
depends=('lib32-zlib' 'lib32-libjpeg' 'lib32-libpng' 'lib32-libtiff' 'lib32-tcl' 'lib32-tk' 'tcllib')
source=(http://downloads.sourceforge.net/tkimg/${pkgver%.*}/Img-$pkgver-Source.tar.gz)
sha1sums=('b35ddb2aad1b9f513f3a4f1eeaf3b7e1b681fc80')

build() {
  cd "$srcdir/Img-$pkgver"

  export CC='gcc -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure --prefix=/usr --libdir=/usr/lib32 --enable-threads
  make
}

package() {
  cd "$srcdir/Img-$pkgver"

  make INSTALL_ROOT="$pkgdir" install
  rm -rf "$pkgdir/usr/"{include,share}
}
