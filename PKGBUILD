pkgname=psp-freetype2
pkgver=2.1.10
pkgrel=1
pkgdesc="TrueType font rendering library (psp)"
arch=(any)
url="http://freetype.sourceforge.net"
license=('GPL')
groups=('psp')
depends=('psp-sdk')
makedepends=('psp-gcc')
options=('!buildflags' '!strip' 'staticlibs')
# before PR#17
source=("git+https://github.com/pspdev/psp-ports.git#commit=c4d3464")
md5sums=('SKIP')


prepare()
{
  cd "$srcdir/psp-ports"
}

build()
{
  cd "$srcdir/psp-ports/freetype"
  sh autogen.sh
  export LDFLAGS="-L$(psp-config --pspsdk-path)/lib -L$(psp-config --psp-prefix)/lib -lc -lpspuser"
  export LIBS="-lc -lpspuser"
  mkdir -p build-psp && pushd build-psp
  ../configure --prefix=/usr/psp --host=psp
  make
}

package()
{
  cd "$srcdir/psp-ports/freetype/build-psp"
  make install DESTDIR="$pkgdir"
}

