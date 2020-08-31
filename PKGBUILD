# Maintainer: Andrew Sun <adsun701 at gmail com>
# Contributor: orumin <dev at orum dot in>

_basename=libwacom
pkgname="lib32-$_basename"
pkgver=1.5
pkgrel=1
pkgdesc="Library to identify Wacom tablets and their features (32-bit)"
arch=('x86_64')
url="https://github.com/linuxwacom/libwacom/wiki"
license=('MIT')
depends=('lib32-glib2' 'lib32-systemd' 'lib32-libgudev' "$_basename")
makedepends=('lib32-libxml2')
validpgpkeys=('3C2C43D9447D5938EF4551EBE23B7E70B467F0BF')
source=(https://github.com/linuxwacom/libwacom/releases/download/${_basename}-${pkgver}/${_basename}-${pkgver}.tar.bz2{,.sig})
sha1sums=('c2cf9dd61e7ff58599e7d0609c1029f41dc13d37'
          'SKIP')
sha256sums=('6b349fb73c8edcf0288d17c49049648214924846b6a58914c2ed3477ff36d47b'
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
