# Maintainer: cyrant <cyrant at tuta dot io>

pkgname=screentranslator
pkgver=2.0.2
pkgrel=2
pkgdesc='Screen capture, OCR and translation tool.'
url='https://gres.biz/screen-translator'
license=('MIT')
arch=('x86_64')
depends=('qt5-webkit' 'qt5-x11extras' 'tesseract')
makedepends=('git' 'qt5-tools')
source=(
  "${pkgname}::git+https://github.com/OneMoreGres/ScreenTranslator.git#tag=${pkgver}"
  "${pkgname}.desktop"
  "${pkgname}.png"
  "${pkgname}.sh"
)
md5sums=(
  'SKIP'
  'ea6465a4f510d71fd7fe50990b0fc056'
  '1db3ff3586cd367175528d5ed6b96504'
  '385a025df439f699aa10fed618201584'
)

build() {
  mkdir -p "${pkgname}-build"
  cd "${pkgname}-build"
  lrelease "../${pkgname}/ScreenTranslator.pro" &&
  qmake CONFIG-=debug_and_release CONFIG+=release "../${pkgname}" &&
  make
}

package() {
  install -Dm755 "${pkgname}-build/ScreenTranslator" "${pkgdir}/opt/${pkgname}/${pkgname}"
  install -Dm644 "${pkgname}/translators"/* -t "${pkgdir}/opt/${pkgname}/translators"
  install -Dm644 "${pkgname}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}
