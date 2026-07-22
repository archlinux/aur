# Maintainer: Jason Wang <wangborong0@gmail.com>

pkgname=freerouting-bin
pkgver=2.2.4
_pkgname=freerouting
pkgrel=1
pkgdesc="Advanced PCB autorouter (pre-built binary release)"
arch=('x86_64')
url="https://github.com/freerouting/freerouting"
license=('GPL-3.0-only')
depends=('glibc' 'sh' 'hicolor-icon-theme')
optdepends=('kicad: for use with PCB editor')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}" "${_pkgname}-git" "${_pkgname}-zh-cn" "${_pkgname}-zh-cn-git")
options=('!strip')
source=("${_pkgname}-${pkgver}-linux-x64.zip::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-x64.zip"
        "${_pkgname}.desktop")
sha512sums=('f0161d37010611881251db2de6abd716eba9247fcb1554b7a6569915333fe326cd875e46ef72786480168d88373fb1b63901d448cdefb656e09a3f935d85054c'
            '04b749854ddb921bc3e6dc6a0fe56a85af7020cc57dd7c32fcab4d66c2186513fdd3949816f936cefe27a3e6372e3d9ce49d9e88f3be3775ff21d054b4ea0f30')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}-linux-x64"

  # install to /opt
  install -dm755 "${pkgdir}/opt/${_pkgname}"
  cp -r . "${pkgdir}/opt/${_pkgname}/"

  # create /usr/bin/freerouting symlink to /opt/freerouting/bin/freerouting
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${_pkgname}/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 "${pkgdir}/opt/${_pkgname}/lib/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"
  install -Dm644 "${pkgdir}/opt/${_pkgname}/lib/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"

  install -Dm644 "${srcdir}/${_pkgname}-${pkgver}-linux-x64/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
