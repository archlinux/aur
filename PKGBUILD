# Maintainer: Javier Tiá <javier dot tia at gmail dot com>

pkgname=coati
_pkgname=Coati
pkgver=0.11.15
_pkgver=${pkgver/\./\_}
pkgrel=3
pkgdesc='A cross-platform source explorer for C/C++ and Java'
arch=('x86_64')
url='https://www.coati.io/'
license=('custom')
options=(!strip)
source=("${pkgname}-${pkgver}.tar.gz::${url}/downloads/${pkgver}/linux/64bit/"
        "coati.desktop")
sha256sums=('aecf8e7dab97640e272086efd113be4f5fcfe3d571384ec62c134d9089eed8de'
            '3081b2217a1f99e965ba052048ddd87afe58702dda24da96bea43c680cf6211c')
noextract=("${pkgname}-${pkgver}.tar.gz")

prepare() {
  mkdir -p "${srcdir}/opt/${pkgname}"
  bsdtar --strip-components 1 -xf "${pkgname}-${pkgver}.tar.gz" \
         -C "${srcdir}/opt/${pkgname}"
}

package() {
  rsync -rtl "${srcdir}/opt" "${pkgdir}"

  mkdir -p "${pkgdir}/usr/bin/"
  mkdir -p "${pkgdir}/usr/share/applications/"
  mkdir -p "${pkgdir}/usr/share/pixmaps/"
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"

  install -m 644 "${srcdir}/coati.desktop" \
            "${pkgdir}/usr/share/applications/"

  ln -s "/opt/${pkgname}/data/gui/icon/logo_1024_1024.png" \
            "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  ln -s "/opt/${pkgname}/EULA.txt" \
            "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/opt/${pkgname}/${_pkgname}.sh" \
            "${pkgdir}/usr/bin/${pkgname}"
}
