# Maintainer: Andrew Sun <adsun701 at gmail com>
# Contributor: orumin <dev at orum dot in>

_basename=libwacom
pkgname="lib32-$_basename"
pkgver=1.11
pkgrel=1
pkgdesc="Library to identify Wacom tablets and their features (32-bit)"
arch=('x86_64')
url="https://github.com/linuxwacom/libwacom/wiki"
license=('MIT')
depends=('lib32-glib2' 'lib32-systemd' 'lib32-libgudev' "$_basename")
makedepends=('lib32-libxml2' 'python')
validpgpkeys=('3C2C43D9447D5938EF4551EBE23B7E70B467F0BF')
source=(https://github.com/linuxwacom/libwacom/releases/download/${_basename}-${pkgver}/${_basename}-${pkgver}.tar.bz2{,.sig})
sha1sums=('07ace02e44acc641fbe6c3e26a0898c664e07cae'
          'SKIP')
sha256sums=('4580a8fbad067a5b187abe864ab80d42d8138d0caec394533bec67bf457e4c58'
            'SKIP')

build() {
  cd "${srcdir}/${_basename}-${pkgver}"

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure --prefix=/usr --libdir=/usr/lib32
  make
}

check() {
  cd "${srcdir}/${_basename}-${pkgver}"
  make check || true
}

package() {
  cd "${srcdir}/${_basename}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rm -rf ${pkgdir}/usr/{bin,share,include}  
}
