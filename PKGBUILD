# Maintainer:
# Contributor: kevku <kevku@gmx.com>

pkgname=xsd
pkgver=4.0.0
_pkgver=4.0.0+dep
pkgrel=1
pkgdesc="An open-source, cross-platform W3C XML Schema to C++ data binding compiler"
arch=('i686' 'x86_64')
url="http://www.codesynthesis.com/products/xsd"
license=('GPL2')
depends=('xerces-c')
source=("http://www.codesynthesis.com/download/${pkgname}/4.0/${pkgname}-${_pkgver}.tar.bz2"
        "xsdcxx.patch")
sha1sums=('ad3de699eb140e747a0a214462d95fc81a21b494'
          'afeb30904eb36efe6751f46cf1dd1ef4cfe45e9f')

prepare() {
  cd ${pkgname}-${_pkgver}
  patch -p1 -i "${srcdir}/xsdcxx.patch"
}

build() {
  cd ${pkgname}-${_pkgver}
  make CXXFLAGS="${CXXFLAGS}"
}

package() {
  cd ${pkgname}-${_pkgver}
  make install_prefix="${pkgdir}/usr" install

  # Fix conflicts with mono
  mv "${pkgdir}"/usr/bin/xsd{,cxx}
  mv "${pkgdir}"/usr/share/man/man1/xsd{,cxx}.1
}
