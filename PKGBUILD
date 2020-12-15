# Maintainer: Javier Tiá <javier dot tia at gmail dot com>

pkgname=sourcetrail
_pkgname=Sourcetrail
pkgver=2020.4.32
_pkgver=${pkgver/\./\_}
_pkgver=${_pkgver/\./\_}
pkgrel=1
pkgdesc='A cross-platform source explorer for C/C++ and Java'
arch=('x86_64')
url='https://www.sourcetrail.com'
license=('LGPL3')
conflicts=('coati')
replaces=('coati')
depends=('libglvnd')
makedepends=('rsync')
provides=("${pkgname}=${pkgver}")
options=(!strip)
_url="https://github.com/CoatiSoftware/Sourcetrail/releases/download"
source=("${pkgname}-${pkgver}.tar.gz::${_url}/${pkgver}/${_pkgname}_${_pkgver}_Linux_64bit.tar.gz"
        "${pkgname}.desktop")
sha256sums=('dfdffeda727c63b98c354f5dc24dd8815f604ee639d3ccab89803d5f55e13327'
            '34d978813c1bba26ed243b15af11ea22800c5d95e4acc430496025d4caf4cc71')
noextract=("${pkgname}-${pkgver}.tar.gz")

prepare() {
  mkdir -p "${srcdir}/opt/${pkgname}"
  bsdtar --strip-components 1 -xf "${pkgname}-${pkgver}.tar.gz" \
         -C "${srcdir}/opt/${pkgname}"
}

package() {
  rsync -rtl "${srcdir}/opt" "${pkgdir}"

  mkdir -p "${pkgdir}/usr/share/applications"
  install -m 644 "${srcdir}/${pkgname}.desktop" \
            "${pkgdir}/usr/share/applications/"
  # license
  #mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  #ln -s "/opt/${pkgname}/EULA.txt" \
  #          "${pkgdir}/usr/share/licenses/${pkgname}"
}
