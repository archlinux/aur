# Maintainer: xantares <xantares09 at hotmail dot com>

pkgname=psp-zziplib
pkgver=0.13.38
pkgrel=1
pkgdesc="A lightweight library that offers the ability to easily extract data from files archived in a single zip file (psp)"
arch=(any)
url="http://zziplib.sourceforge.net"
license=('LGPL', 'MPL')
groups=('psp')
depends=('psp-sdk' 'psp-zlib')
makedepends=('psp-gcc')
options=('!buildflags' '!strip' 'staticlibs')
source=("git+https://github.com/pspdev/psp-ports.git")
md5sums=('SKIP')


build()
{
  cd "$srcdir/psp-ports/zziplib"
  export LDFLAGS="-L$(psp-config --pspsdk-path)/lib -L$(psp-config --psp-prefix)/lib -lc -lpspuser"
  export LIBS="-lc -lpspuser"
  mkdir -p build-psp && pushd build-psp
  ../configure --prefix=/usr/psp --host=psp 
  make
}

package()
{
  cd "$srcdir/psp-ports/zziplib/build-psp"
  make install DESTDIR="$pkgdir"
}

