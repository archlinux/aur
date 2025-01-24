# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
pkgname=mdsilo-bin
pkgver=0.5.9
pkgrel=1
pkgdesc="Lightweight Knowledge Base and Feed Reader.(Prebuilt version)"
arch=('x86_64')
url="https://mdsilo.com/"
_ghurl="https://github.com/mdSilo/mdSilo-app"
license=('AGPL-3.0-or-later')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
  'gtk3'
  'webkit2gtk'
  'libsoup'
)
source=(
  "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/app-v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
)
sha256sums=('017b9afddf6fcc4c45f16379e4d8e96bf7e2a18ec1c6cdeef5d9f79571f998af')
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