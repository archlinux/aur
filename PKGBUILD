# Contributor: Jonathan Liu <net147@gmail.com>
# Maintainer: Davorin Učakar <davorin.ucakar@gmail.com>

pkgname=stlport
_realpkgname=STLport
pkgver=5.2.1
pkgrel=2
pkgdesc="An implementation of the C++ Standard Library"
arch=('i686' 'x86_64')
url="http://www.stlport.org/"
license=('custom')
depends=('gcc-libs')
source=("http://downloads.sourceforge.net/project/${pkgname}/${_realpkgname}/${_realpkgname}-${pkgver}/${_realpkgname}-${pkgver}.tar.gz")
md5sums=('b20ace9f4a487b2614dfbb205bee112c')

build() {
  cd "${srcdir}/${_realpkgname}-${pkgver}"

  _CFLAGS="$CFLAGS"
  _CXXFLAGS="$CXXFLAGS"
  _LDFLAGS="$LDFLAGS"

  unset CFLAGS
  unset CXXFLAGS
  unset LDFLAGS

  ./configure --prefix="${pkgdir}/usr" \
              --with-extra-cflags="$_CFLAGS" \
              --with-extra-cxxflags="$_CXXFLAGS" \
              --with-extra-ldflags="$_LDFLAGS"
  make -j1
}

package() {
  cd "${srcdir}/${_realpkgname}-${pkgver}"

  install -dm755 "${pkgdir}/usr/lib"
  install -dm755 "${pkgdir}/usr/include"
  make install

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  # Extract licence from README and strip leading '*' and unecessary empty lines.
  cat README | grep '^ \*' | sed -r 's/ \* ?//; $ d; /./,/^$/ !d' > \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
