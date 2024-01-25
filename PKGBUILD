# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
pkgname=mdsilo-bin
pkgver=0.5.7
pkgrel=3
pkgdesc="Lightweight Knowledge Base and Feed Reader."
arch=('x86_64')
url="https://mdsilo.com/"
_ghurl="https://github.com/mdSilo/mdSilo-app"
license=('AGPL-3.0-or-later')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
  'gtk3'
  'hicolor-icon-theme'
  'webkit2gtk'
  'libsoup'
)
source=(
  "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/app-v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
)
sha256sums=('a70d0fa49072da91a2ddbee28f824620cd9d80d4a267502e7724f4c02175b194')
build() {
  bsdtar -xf "${srcdir}/data.tar.gz"
  sed "s|Exec=${pkgname%-bin}|Exec=${pkgname%-bin} %U|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
  install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
  for _icons in 32x32 128x128 256x256@2;do
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
      -t "${pkgdir}/usr/share/icons/hicolor/${_icons%@2}/apps"
  done
  install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}