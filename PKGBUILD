# Maintainer: Jose Riha <jose 1711 gmail com>
# Contributor: Sven-Hendrik Haase <sh at lutzhaase.com>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Drew Desai <alerante at yahoo.com>
# Contributor: Hugo Ideler <hugoideler at dse.nl>

pkgname=hawknl
pkgver=1.68
pkgrel=3
pkgdesc="An open source game oriented network API"
arch=('i686' 'x86_64')
url="http://www.hawksoft.com/hawknl/"
license=('LGPL')
depends=('glibc')
source=(https://src.fedoraproject.org/lookaside/extras/hawknl/HawkNL168src.tar.gz/2e4971d422b8c5cadfe2a85527ff2fcf/HawkNL168src.tar.gz
        $pkgname.patch)
md5sums=('2e4971d422b8c5cadfe2a85527ff2fcf'
         '2139c9f675af34e19446d9f76ac1d649')

build() {
  cd "$srcdir"/$pkgname$pkgver

  patch -Np0 --binary -i ../$pkgname.patch
  make -f makefile.linux
  make -f makefile.linux \
    LIBDIR="$pkgdir"/usr/lib \
    INCDIR="$pkgdir"/usr/include \
    OPTFLAGS="-D_GNU_SOURCE -D_REENTRANT" 
}

package() {
  cd "$srcdir"/$pkgname$pkgver
  mkdir "$pkgdir/hawknl"
  ls -ld

  make -f makefile.linux \
    LIBDIR="$pkgdir"/usr/lib \
    INCDIR="$pkgdir"/usr/include \
    OPTFLAGS="-D_GNU_SOURCE -D_REENTRANT" \
    install
}
