pkgname=psp-sdk
pkgver=1.0
pkgrel=1
pkgdesc="An open-source SDK for PSP homebrew development (psp)"
arch=(any)
url="https://github.com/pspdev/pspsdk"
license=('GPL')
groups=('psp')
depends=('zlib')
makedepends=('psp-gcc' 'git')
options=('!buildflags' '!strip' 'staticlibs')
source=("https://github.com/pspdev/pspsdk/archive/master.zip")
md5sums=('SKIP')

build()
{
  cd "$srcdir/pspsdk-master"
  ./bootstrap
  mkdir -p build-psp && pushd build-psp
  ../configure --with-pspdev=/usr --target=psp
  make
}

package()
{
  cd "$srcdir/pspsdk-master/build-psp"
  make install DESTDIR="$pkgdir"
}

