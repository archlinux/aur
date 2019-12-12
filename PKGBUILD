# Maintainer: Andrew Sun <adsun701 at gmail dot com>

pkgname=lib32-libmnl
_pkgbasename=libmnl
pkgver=1.0.4
pkgrel=3
pkgdesc='Minimalistic user-space library oriented to Netlink developers. (32-bit)'
arch=('x86_64')
url='https://www.netfilter.org/projects/libmnl/'
license=('LGPL2.1')
depends=('lib32-glibc' 'libmnl')
makedepends=('gcc-multilib')
validpgpkeys=('C09DB2063F1D7034BA6152ADAB4655A126D292E4') # Netfilter Core Team
source=("https://www.netfilter.org/projects/${_pkgbasename}/files/${_pkgbasename}-${pkgver}.tar.bz2"{,.sig})
sha1sums=('2db40dea612e88c62fd321906be40ab5f8f1685a'
          'SKIP')

build() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  export LDFLAGS+=' -m32'
  
  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib32
  make
}

package() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,include,share}
}
