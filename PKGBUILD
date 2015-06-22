pkgname=psp-sdk
pkgver=1.0
pkgrel=1
pkgdesc="An open-source SDK for PSP homebrew development (psp)"
arch=(any)
url="http://www.gnu.org/software/binutils/"
license=('GPL')
groups=('psp')
depends=('zlib')
makedepends=('psp-gcc' 'git')
conflicts=('psp-sdk-base')
provides=('psp-sdk-base')
options=('!buildflags' '!strip' 'staticlibs')
source=("git+https://github.com/pspdev/pspsdk.git")
md5sums=('SKIP')


prepare()
{
  cd "$srcdir/pspsdk"
  sed -i "/Could not allocate the section data buffer/d" tools/unpack-pbp.c
}

build()
{
  cd "$srcdir/pspsdk"
  ./bootstrap
  mkdir -p build-psp && pushd build-psp
  ../configure --prefix=/usr --target=psp
  make
}

package()
{
  cd "$srcdir/pspsdk/build-psp"
  make install DESTDIR="$pkgdir"
}

