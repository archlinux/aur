#
# PKGBUILD for sidfactory2 (SID Factory II))
#
# Maintainer: Uffe Jakobsen <microtop@starion.dk>
#
# blog: http://blog.chordian.net/sf2/
# github: https://github.com/Chordian/sidfactory2
#

_pkgname=sidfactory2
pkgname=${_pkgname}
pkgver=20200911
pkgrel=1
pkgdesc=""
arch=('i686' 'x86_64')
url="https://github.com/Chordian/sidfactory2"
license=('GPL')
makedepends=('pkgconfig' 'make' 'gcc')
depends=('sdl2')
optdepends=()
conflicts=('sidfactory2-unstable')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/Chordian/${_pkgname}/archive/release-${pkgver//_/-}.tar.gz")
md5sums=('dbba94f8e31f43618354033596470374')
pkg_name_ver="${_pkgname}-release-${pkgver//_/-}"

#
#
#
prepare()
{
  cd "${srcdir}/${pkg_name_ver}"
  cp "${startdir}/Makefile.sf2" Makefile
  #patch -p0 < "${startdir}/CMakeLists.txt.patch"
}

#
#
#
build()
{
  cd "${srcdir}/${pkg_name_ver}"
  make
}

#
#
#
package()
{
  cd "${srcdir}/${pkg_name_ver}"
  make dist
  install -m 755 -D "${srcdir}/${pkg_name_ver}/artifacts/SIDFactoryII" "${pkgdir}/usr/bin/SIDFactoryII"
  ln -sf SIDFactoryII "${pkgdir}/usr/bin/sidfactory2"
  install -m 644 -D "${srcdir}/${pkg_name_ver}/dist/documentation/faq.txt" "${pkgdir}/usr/share/doc/${pkgname}/faq.txt"
  install -m 644 -D "${srcdir}/${pkg_name_ver}/dist/documentation/user_manual.pdf" "${pkgdir}/usr/share/doc/${pkgname}/user_manual.pdf"
  install -m 755 -d "${pkgdir}/usr/share/${pkgname}"
  cp -R "${srcdir}/${pkg_name_ver}/artifacts/config" "${pkgdir}/usr/share/${pkgname}"
  cp -R "${srcdir}/${pkg_name_ver}/artifacts/drivers" "${pkgdir}/usr/share/${pkgname}"
  cp -R "${srcdir}/${pkg_name_ver}/artifacts/overlay" "${pkgdir}/usr/share/${pkgname}"
  cp -R "${srcdir}/${pkg_name_ver}/artifacts/color_schemes" "${pkgdir}/usr/share/${pkgname}"
  cp -R "${srcdir}/${pkg_name_ver}/artifacts/music" "${pkgdir}/usr/share/${pkgname}"

  #
  #make -j1 DESTDIR="${pkgdir}" install
  #install -m 644 -D "${srcdir}/${pkg_name_ver}/SIDFactoryII/COPYING" "${pkgdir}/usr/share/licenses/${_pkgname}/COPYING"
  #
}

#
# EOF
#
