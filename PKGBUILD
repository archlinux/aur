# Maintainer: afward <archlinux.gargoyley@simplelogin.co>
pkgname=yakyak
pkgver=1.5.9
_pkgid="${pkgname}-${pkgver}"
pkgrel=1
pkgdesc="Desktop chat client for Google Hangouts"
arch=('x86_64' 'i686')
url="https://github.com/yakyak/yakyak"
license=('MIT')
depends=('electron')
optdepends=('emojione-color-font: Emoji support')
makedepends=('nodejs' 'npm')

sha256sums=('9a8e171e3129f52aa6028761fbe247a6b0dafc47b94851b2df58c88f38eba420'
            '12baee4e3e926b765ebe21493adb7aa416165c7191f583694670b08d9b9c5360'
            '0a02abfbceb1029301308239f8d0a1e8e5a5565d66c561223836ecaaf7cb5046')

source=("${_pkgid}.tar.gz::https://github.com/yakyak/yakyak/archive/v${pkgver}.tar.gz"
        "yakyak.desktop"
        "yakyak.sh")

build() {
  cd "${srcdir}/${_pkgid}"

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

  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/${_pkgid}/LICENSE"
  install -Dm644 "${srcdir}/${_pkgid}/app/icons/icon@32.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "${srcdir}/yakyak.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm755 "${srcdir}/yakyak.sh" "${pkgdir}/usr/bin/${pkgname}"

  mv "${srcdir}/${_pkgid}/app" "${pkgdir}/usr/share/${pkgname}/"
}
