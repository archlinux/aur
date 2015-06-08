
pkgname=psp-bzip2
pkgver=1.0.6
pkgrel=1
pkgdesc="A high-quality data compression program (psp)"
arch=(any)
url="http://sources.redhat.com/bzip2"
license=('custom')
groups=('psp')
depends=('psp-sdk')
makedepends=('psp-gcc')
options=('!buildflags' '!strip' 'staticlibs')
source=("http://www.bzip.org/${pkgver}/bzip2-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/pspdev/psplibraries/master/patches/bzip2-${pkgver}-PSP.patch")
md5sums=('00b516f4704d4a7cb50a1d97e6e8e15b'
         'SKIP')

prepare() {
  cd "$srcdir/bzip2-${pkgver}"
  rm -f README.PSP
  patch -p1 -i "${srcdir}"/bzip2-${pkgver}-PSP.patch
}

build()
{
  cd "$srcdir/bzip2-${pkgver}"
  make
}

package()
{
  cd "$srcdir/bzip2-${pkgver}"
  make install PREFIX="$pkgdir"/usr/psp
}

