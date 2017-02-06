# Maintainer: Max Kueng <me [at] maxkueng [dot] com>
pkgname=yakyak
pkgver=1.4.1
_pkgid="${pkgname}-${pkgver}"
pkgrel=0
pkgdesc="Desktop client for Google Hangouts"
arch=('x86_64' 'i686')
url="https://github.com/yakyak/yakyak"
license=('MIT')
depends=('electron>=1.4.0')
optdepends=('emojione-color-font: Emoji support')
makedepends=('nodejs' 'npm')

sha256sums=('5412e9247d7bab33fefd7f156f76ad1664075bf58a7914399d7c3e9deee2300e'
            '12baee4e3e926b765ebe21493adb7aa416165c7191f583694670b08d9b9c5360'
            '0a02abfbceb1029301308239f8d0a1e8e5a5565d66c561223836ecaaf7cb5046')

source=("${_pkgid}.tar.gz::https://github.com/yakyak/yakyak/archive/v${pkgver}.tar.gz"
        "yakyak.desktop"
        "yakyak.sh")

build() {
  cd "${srcdir}/${_pkgid}"

  sed -i.bak '/"electron-prebuilt"/d' ./package.json
  npm install --production=false
  npm run gulp
}

package() {
  install -dm755 "${pkgdir}/usr/share"
  install -dm755 "${pkgdir}/usr/share/${pkgname}"
  install -dm755 "${pkgdir}/usr/share/pixmaps"
  install -dm755 "${pkgdir}/usr/share/licenses"
  install -dm755 "${pkgdir}/usr/share/applications"
  install -dm755 "${pkgdir}/usr/bin"

  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/${_pkgid}/LICENSE"
  install -Dm644 "${srcdir}/${_pkgid}/app/icons/icon@32.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "${srcdir}/yakyak.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm755 "${srcdir}/yakyak.sh" "${pkgdir}/usr/bin/${pkgname}"

  mv "${srcdir}/${_pkgid}/app" "${pkgdir}/usr/share/${pkgname}/"
}

# vim:set ts=2 sw=2 et:
