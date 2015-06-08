
pkgname=psp-libpng
pkgver=1.5.7
pkgrel=1
pkgdesc="PNG reference library (psp)"
arch=(any)
url="http://www.libpng.org"
license=('GPL')
groups=('psp')
depends=('psp-sdk' 'psp-zlib')
makedepends=('psp-gcc')
options=('!buildflags' '!strip' 'staticlibs')
source=("http://sourceforge.net/projects/libpng/files/libpng15/older-releases/${pkgver}/libpng-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/pspdev/psplibraries/master/patches/libpng-${pkgver}-PSP.patch")
md5sums=('944b56a84b65d94054cc73d7ff965de8'
         'SKIP')

prepare() {
  cd "$srcdir/libpng-${pkgver}"
  rm -f Makefile pnglibconf.h README.PSP screenshot/main.c screenshot/Makefile 
  patch -p1 -i "$srcdir"/libpng-${pkgver}-PSP.patch
}

build()
{
  cd "$srcdir/libpng-${pkgver}"
  make
}

package()
{
  cd "$srcdir/libpng-${pkgver}"
  make install PSPDIR="$pkgdir"/usr/psp
}

