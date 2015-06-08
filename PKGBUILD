# $Id: PKGBUILD 90079 2013-05-06 19:39:08Z foutrelis $
# Maintainer: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: BlackEagle < ike DOT devolder AT gmail DOT com >
# Contributor: Preecha Patumchareonpol <yumyai at gmail.com> 

pkgname=podofo-lua52
pkgver=0.9.2
pkgrel=1
pkgdesc="A C++ library to work with the PDF file format"
arch=('i686' 'x86_64')
url="http://podofo.sourceforge.net"
license=('GPL')
depends=('openssl' 'libidn' 'lua51' 'fontconfig' 'libpng' 'libtiff')
makedepends=('cmake')
source=("http://downloads.sourceforge.net/${pkgname%-lua52}/${pkgname%-lua52}-${pkgver}.tar.gz" podofo-lua52.patch)
md5sums=('41966c57fa4266ac5cef80bfade0c8e7'
         'ef9d0ae00aa507579c7be1e828f59164')

prepare() {
  cd ${pkgname%-lua52}-${pkgver}
  patch -p1 < $srcdir/podofo-lua52.patch
}

build() {
  cd ${pkgname%-lua52}-${pkgver}

  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr .. \
        -DPODOFO_BUILD_SHARED=1 \
        -DPODOFO_HAVE_JPEG_LIB=1 \
        -DPODOFO_HAVE_PNG_LIB=1 \
        -DPODOFO_HAVE_TIFF_LIB=1
  make
}

package() {
  cd ${pkgname%-lua52}-${pkgver}/build
  make DESTDIR=$pkgdir install
}
