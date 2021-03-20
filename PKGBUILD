pkgname=psp-libtremor-git
pkgver=1.0.2
pkgrel=1
pkgdesc="Integer-only, fully Ogg Vorbis compliant software decoder library (psp)"
arch=(any)
url="http://www.xiph.org/vorbis/"
license=('BSD')
groups=('psp')
depends=('psp-sdk')
makedepends=('psp-gcc' 'git')
provides=('psp-libtremor')
conflicts=('psp-libtremor')
options=('!buildflags' '!strip' 'staticlibs')
source=("git+https://github.com/pspdev/psp-ports.git")
md5sums=('SKIP')

build()
{
  cd "$srcdir/psp-ports/libTremor"
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
  cd "$srcdir/psp-ports/libTremor/build-psp"
  make install DESTDIR="$pkgdir"
}

