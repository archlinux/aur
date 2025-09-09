# Maintainer: Butui Hu <hot123tea123@gmail.com>

pkgname=3dslicer-bin
_pkgname=3dslicer
_name=Slicer
pkgver=5.8.1
pkgrel=3
pkgdesc='A free, open source and multi-platform software package widely used for medical, biomedical, and related imaging research'
arch=('x86_64')
url='https://www.slicer.org'
license=('BSD-3-Clause')
depends=('dbus' 'glib2')
makedepends=('gendesk')
provides=('3dslicer')
conflicts=('3dslicer')
options=(!strip !emptydirs)
source=(
    "${_name}-${pkgver}.tar.gz::http://download.slicer.org/download?os=linux&stability=release"
    "${_pkgname}.svg::https://www.slicer.org/assets/img/3D-Slicer-Mark.svg"
)
sha512sums=('56a3b278b72124344c6ddd0be4a27f467c996032ae477226b4a9f7a3c64eec4047aaf8d8868580854d4acfdb00679118b3fbab4ecf955e838ce010338036c9c8'
            '3422d244f819a7ec4c475d3d8a90c79fcb73738920c0830b100c6342ca24d5be607ba60ee3d91892402036a0adf31d5ab7c8fc83f451121a7b537f7de5306014')

prepare() {
  echo "Creating desktop file"
  gendesk -f -n \
    --categories "Graphics;MedicalSoftware;Science;" \
    --custom="StartupWMClass=Slicer" \
    --exec "Slicer" \
    --icon "${_pkgname}" \
    --pkgdesc "${pkgdesc}" \
    --pkgname ${_pkgname} \
    --startupnotify
}

package() {
  install -d "${pkgdir}/opt" "${pkgdir}/usr/bin"
  cp -a "${srcdir}/${_name}-${pkgver}-linux-amd64" "${pkgdir}/opt/${_pkgname}"
  ln -s /opt/${_pkgname}/Slicer "${pkgdir}/usr/bin/Slicer"
  install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 "${srcdir}/${_pkgname}.svg" "${pkgdir}/usr/share/pixmaps/${_pkgname}.svg"
}
# vim:set ts=2 sw=2 et:
