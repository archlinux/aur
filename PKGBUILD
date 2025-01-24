# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=pointless-bin
_pkgname=Pointless
pkgver=1.11.0
pkgrel=1
pkgdesc="An endless drawing canvas desktop app made with Tauri (Rust) and React 🎨 ✍️.(Prebuilt version)"
arch=('x86_64')
url="https://github.com/kkoomen/pointless"
license=('AGPL-3.0-or-later')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
  'gtk3'
  'webkit2gtk'
)
source=(
  "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
)
sha256sums=('d096d1e1ff31ba172520a033711bdf0b1b5d9bed81712326bde6e00661949b7b')
prepare() {
  bsdtar -xf "${srcdir}/data."*
}
package() {
  install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
  _icon_sizes=(32x32 128x128 256x256@2)
  for _icons in "${_icon_sizes[@]}";do
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
      -t "${pkgdir}/usr/share/icons/hicolor/${_icons%@2}/apps"
  done
  install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}