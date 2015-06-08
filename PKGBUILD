# Maintainer: xantares <xantares09 at hotmail dot com>

pkgname=psp-libvorbis
pkgver=1.1.1
pkgrel=1
pkgdesc="Vorbis codec library (psp)"
arch=(any)
url="http://www.xiph.org/vorbis/"
license=('BSD')
groups=('psp')
depends=('psp-sdk')
makedepends=('psp-gcc')
options=('!buildflags' '!strip' 'staticlibs')
source=("git+https://github.com/pspdev/psp-ports.git")
md5sums=('SKIP')


build()
{
  cd "$srcdir/psp-ports/libvorbis"
  sh autogen.sh
  make distclean # autogen calls configure
  export LDFLAGS="-L$(psp-config --pspsdk-path)/lib -L$(psp-config --psp-prefix)/lib -lc -lpspuser"
  export LIBS="-lc -lpspuser"
  mkdir -p build-psp && pushd build-psp
  ../configure --prefix=/usr/psp --host=psp 
  make
}

package()
{
  cd "$srcdir/psp-ports/libvorbis/build-psp"
  make install DESTDIR="$pkgdir"
}

