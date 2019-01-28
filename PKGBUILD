# Maintainer: Jose Riha <jose 1711 gmail com>
# Contributor: Sven-Hendrik Haase <sh at lutzhaase.com>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Drew Desai <alerante at yahoo.com>
# Contributor: Hugo Ideler <hugoideler at dse.nl>

pkgname=hawknl
pkgver=1.70
pkgrel=3
pkgdesc="An open source game oriented network API"
arch=('i686' 'x86_64')
url="http://www.hawksoft.com/hawknl/"
license=('LGPL')
depends=('glibc')
source=(https://github.com/dfyx/HawkNL/archive/master.zip hawknl.patch)
md5sums=('d972d5a697a10734c65f3426480331ad'
         '7dec01dc297e2a4d3c515f6747dc5c9a')

build() {
  cd "$srcdir"/HawkNL-master

  patch -Np2 --binary -i "${srcdir}/${pkgname}.patch"
  make -f makefile.linux \
    LIBDIR="$pkgdir"/usr/lib \
    INCDIR="$pkgdir"/usr/include \
    OPTFLAGS="-D_GNU_SOURCE -D_REENTRANT" 
}

package() {
  cd "$srcdir"/HawkNL-master
  mkdir -p "${pkgdir}"/usr/{lib,include}

  make -f makefile.linux \
    LIBDIR="$pkgdir"/usr/lib \
    INCDIR="$pkgdir"/usr/include \
    OPTFLAGS="-D_GNU_SOURCE -D_REENTRANT" \
    install
  install -Dm644 src/nlinternal.h "${pkgdir}/usr/include/nlinternal.h"
  install -Dm644 include/hawklib.h "${pkgdir}/usr/include/hawklib.h"
  install -Dm644 include/hawkthreads.h "${pkgdir}/usr/include/hawkthreads.h"
}
