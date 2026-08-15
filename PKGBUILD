# Maintainer: Omansh Krishn <omansh@duck.com>

_pkgname=gotohp
pkgname=${_pkgname}-bin
pkgver=0.9.0
pkgrel=1
pkgdesc='Unofficial Google Photos Desktop GUI Client - binary version'
arch=('x86_64')
url='https://github.com/xob0t/gotohp'
license=('MIT')
depends=(
  gtk4
  webkitgtk-6.0
)
provides=("${_pkgname}" "${_pkgname}=${pkgver}")
conflicts=("${_pkgname}" "${_pkgname}-git")
options=(!debug)

source=("${_pkgname}_v${pkgver}_${CARCH}.deb"::"${url}/releases/download/v${pkgver}/${_pkgname}_amd64.deb"
        "${_pkgname}.desktop"::"https://github.com/xob0t/gotohp/raw/refs/tags/v${pkgver}/build/linux/desktop")
sha256sums=('ac6e1ddd8c10277d4e1bd1b91a2b098d9f0b0a2e8c2c05a7edd6ddec214926c8'
            'f2ca2165f787496c7384cc132006402999e61026a4c2c7c8d71d587a5db8248e')

package() {
  cd "${srcdir}"
  tar -xf "${srcdir}/data.tar.gz"

  install -dm755 "${pkgdir}/usr/bin"
  install -m755 "${srcdir}/usr/local/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -dm755 "${pkgdir}/usr/share/icons/hicolor/128x128/apps"
  install -m644 "${srcdir}/usr/share/icons/hicolor/128x128/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${_pkgname}.png"

  install -dm755 "${pkgdir}/usr/share/applications"
  sed -i "s|^Exec=.*|Exec=${_pkgname}|" "${_pkgname}.desktop"
  install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
