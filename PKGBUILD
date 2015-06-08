# Maintainer: xantares <xantares09 at hotmail dot com>

pkgname=psp-sdk-base
pkgver=1.0
pkgrel=1
pkgdesc="An open-source SDK for PSP homebrew development (bootstrap) (psp)"
arch=(any)
url="http://www.gnu.org/software/binutils/"
license=('GPL')
groups=('psp')
depends=('zlib')
makedepends=('psp-gcc-base' 'git')
conflicts=('psp-sdk')
options=('!buildflags' '!strip' 'staticlibs')
source=("git+https://github.com/pspdev/pspsdk.git")
md5sums=('SKIP')

build()
{
  cd "$srcdir/pspsdk"
  ./bootstrap
  mkdir -p build-psp && pushd build-psp
  ../configure --prefix=/usr --target=psp
}

package()
{
  cd "$srcdir/pspsdk/build-psp"
  make install-data DESTDIR="$pkgdir"
}

