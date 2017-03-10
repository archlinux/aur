# Maintainer: Javier Tiá <javier dot tia at gmail dot com>

pkgname=coati
_pkgname=Coati
pkgver=0.11.15
_pkgver=${pkgver/\./\_}
pkgrel=2
pkgdesc='A cross-platform source explorer for C/C++ and Java'
arch=('i686' 'x86_64')
url='https://www.coati.io/'
license=('custom')
options=(!strip)
source=("${pkgname}-${pkgver}.tar.gz::${url}/downloads/${pkgver}/linux/64bit/"
	"coati.desktop")
sha256sums=('aecf8e7dab97640e272086efd113be4f5fcfe3d571384ec62c134d9089eed8de'
            '7fff951a9be6efdeadc9419a2a738fa73095d6ee435091a214ce14f652832b21')
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
