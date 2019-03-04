# Maintainer: Craig Jackson <tapocol@protonmail.com>

pkgname=yakyak-stable
pkgver=1.5.3
pkgrel=0
pkgdesc="Desktop client for Google Hangouts (no pre-release)"
arch=('x86_64' 'i686')
url="https://github.com/yakyak/yakyak"
license=('MIT')
depends=('electron>=3.0.10')
optdepends=('emojione-color-font: Emoji support')
makedepends=('nodejs' 'npm')
provides=("yakyak")
conflicts=("yakyak")

sha256sums=('e7b8d0828da2ec099bbde541fe8cfdbcb03d5e1f4cca75dd5578f9cf8b2f50a7'
            '7f7e19c5ba6d8a697ea666db0a732e438c17a53add3175b0a522df45f79efec2'
            '0a02abfbceb1029301308239f8d0a1e8e5a5565d66c561223836ecaaf7cb5046')

source=("v${pkgver}.tar.gz::https://github.com/yakyak/yakyak/archive/v${pkgver}.tar.gz"
        "yakyak.desktop"
        "yakyak.sh")

build() {
  cd "${srcdir}/v${pkgver}"

  sed -i.bak '/"electron:*"/d' ./package.json
  npm install
  npm run gulp
}

package() {
  install -dm755 "${pkgdir}/usr/share"
  install -dm755 "${pkgdir}/usr/share/${pkgname}"
  install -dm755 "${pkgdir}/usr/share/pixmaps"
  install -dm755 "${pkgdir}/usr/share/licenses"
  install -dm755 "${pkgdir}/usr/share/applications"
  install -dm755 "${pkgdir}/usr/bin"

  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/${pkgver}/LICENSE"
  install -Dm644 "${srcdir}/${pkgver}/app/icons/icon@32.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "${srcdir}/yakyak.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm755 "${srcdir}/yakyak.sh" "${pkgdir}/usr/bin/${pkgname}"

  mv "${srcdir}/${pkgver}/app" "${pkgdir}/usr/share/${pkgname}/"
}
