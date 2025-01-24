# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=devtools-x-bin
_pkgname=DEVTOOLS-X
pkgver=3.4.1
pkgrel=1
pkgdesc="Collection of offline first developer utilities available as non-electron desktop application. all in one place.(Prebuilt version)"
arch=('x86_64')
url="https://devtools.fosslife.com/"
_ghurl="https://github.com/fosslife/devtools-x"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=()
source=(
  "${pkgname%-bin}-${pkgver}.rpm::${_ghurl}/releases/download/devtoolsx-v${pkgver}/${pkgname%-bin}-${pkgver}-1.${CARCH}.rpm"
  "LICENSE-${pkgver}::https://raw.githubusercontent.com/fosslife/devtools-x/devtoolsx-v${pkgver}/LICENSE"
)
sha256sums=('377b97f8a1aef3a5f402b6ed1886073f4e412896826fe340edcee4355e2eb2ef'
            'b410af93589ca25bdf690dcf56663a9452de9a11ecb9e7437cc9a30e1420a4d5')
package() {
  install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
  _icon_sizes=(32x32 128x128 256x256@2)
  for _icons in "${_icon_sizes[@]}";do
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
      -t "${pkgdir}/usr/share/icons/hicolor/${_icons%@2}/apps"
  done
  install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm644 "${srcdir}/LICENSE-${pkgver}" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}