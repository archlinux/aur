# Maintainer: Max Kueng <me [at] maxkueng [dot] com>
pkgname=yakyak
pkgver=1.5.4
_pkgid="${pkgname}-${pkgver}-beta-rolling"
pkgrel=1
pkgdesc="Desktop client for Google Hangouts"
arch=('x86_64' 'i686')
url="https://github.com/yakyak/yakyak"
license=('MIT')
depends=('electron4')
optdepends=('emojione-color-font: Emoji support')
makedepends=('nodejs' 'npm')

sha256sums=('ce1a87e873d5f8b52765bd2e9d1f9f828f26895c35b660db5629e75706a815d4'
            '12baee4e3e926b765ebe21493adb7aa416165c7191f583694670b08d9b9c5360'
            'ad6630d8c423ccdcc5c7989ad8c379c37947a2d6565866856012e32dc00671d1')

source=("${_pkgid}.tar.gz::https://github.com/yakyak/yakyak/archive/v${pkgver}-beta-rolling.tar.gz"
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

# vim:set ts=2 sw=2 et:
