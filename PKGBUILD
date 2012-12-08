# Maintainer: kevku <kevku@gmx.com>

pkgname=xsd
pkgver=3.3.0
_pkgver=3.3.0-2+dep
pkgrel=6
pkgdesc="An open-source, cross-platform W3C XML Schema to C++ data binding compiler"
arch=('i686' 'x86_64')
url="http://www.codesynthesis.com/products/xsd"
license=('GPL2')
depends=('boost-libs' 'xerces-c')
makedepends=('boost')
source=("http://www.codesynthesis.com/download/${pkgname}/3.3/${pkgname}-${_pkgver}.tar.bz2"
        "xsdcxx.patch")
sha1sums=('1c9de9271f589b8ecf2be18f2e9ac87330fc8281'
          '8f7ca8bf0440b30d8f5823e0f528db19810706f2')

build() {
  cd "${pkgname}-${_pkgver}"
  patch -p0 -i "${srcdir}/xsdcxx.patch"

  make CXXFLAGS="${CXXFLAGS}"
}

package() {
  cd ${pkgname}-${_pkgver}
  make install_prefix="$pkgdir/usr" install

  # Fix conflicts with mono
  mv "${pkgdir}"/usr/bin/xsd{,cxx}
  mv "${pkgdir}"/usr/share/man/man1/xsd{,cxx}.1
}
