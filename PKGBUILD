# Maintainer: xantares <xantares09 at hotmail dot com>

pkgname=psp-zlib
pkgver=1.2.8
pkgrel=1
pkgdesc="Compression library implementing the deflate compression method found in gzip and PKZIP (psp)"
arch=(any)
url="http://www.zlib.net/"
license=('custom')
groups=('psp')
depends=('psp-sdk')
makedepends=('psp-gcc')
options=('!buildflags' '!strip' 'staticlibs')
source=("http://sourceforge.net/projects/libpng/files/zlib/${pkgver}/zlib-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/pspdev/psplibraries/master/patches/zlib-${pkgver}-PSP.patch")
md5sums=('44d667c142d7cda120332623eab69f40'
         'SKIP')

prepare() {
  cd "$srcdir/zlib-${pkgver}"
  rm -f README.PSP
  patch -p1 -i "$srcdir"/zlib-${pkgver}-PSP.patch
}

build()
{
  cd "$srcdir/zlib-${pkgver}"
  make
}

package()
{
  cd "$srcdir/zlib-${pkgver}"
  make install PSPDIR="$pkgdir"/usr/psp
}

