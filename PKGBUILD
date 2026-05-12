# Maintainer: fedexmachina
_pkgname=arubasign
pkgname=${_pkgname}-rolling-bin
pkgver=25.2.0
pkgrel=2
pkgdesc='Aruba Digital Signature Suite for signing and verifying documents'
arch=('x86_64')
url='https://www.pec.it/Download.aspx'
license=('LicenseRef-ArubaPEC')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'cairo'
  'ccid'
  'cups'
  'dbus'
  'expat'
  'gtk3'
  'hicolor-icon-theme'
  'libdrm'
  'libxcomposite'
  'libxdamage'
  'libxfixes'
  'libxkbcommon'
  'libxrandr'
  'mesa'
  'nspr'
  'nss'
  'pango'
  'pcsclite'
  'python'
)
optdepends=('pcsc-tools: smartcard debugging tools')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip')
source=("ArubaSign-latest-LINUX.tar.zst::https://updatesfirma.aruba.it/downloads/ArubaSign-latest-LINUX.tar.zst"
  "${_pkgname}.sh"
  "${_pkgname}.desktop")
sha256sums=('SKIP'
  '44d5a13f18d60851de6c71d4a336a54a90f9a1f2b82813e52e685c22e46ac6d2'
  '4faa020d89f19c5f9f5c3cc5301c8a6f00cf12a769f0e4a4cd1f0cec73c864f9')

pkgver() {
  awk -F' = ' '$1 == "pkgver" { sub(/-.*/, "", $2); print $2; exit }' .PKGINFO
}

package() {
  install -dm755 "${pkgdir}/opt"
  cp -r "opt/${_pkgname}" "${pkgdir}/opt/"

  chmod +x \
    "${pkgdir}/opt/${_pkgname}/app/lin-x64/ArubaSign" \
    "${pkgdir}/opt/${_pkgname}/app/lin-x64/arubasign.bat" \
    "${pkgdir}/opt/${_pkgname}/app/lin-x64/chrome_crashpad_handler" \
    "${pkgdir}/opt/${_pkgname}/app/lin-x64/chrome-sandbox" \
    "${pkgdir}/opt/${_pkgname}/asp/lin-x64/ArubaSignPlatform.exe" \
    "${pkgdir}/opt/${_pkgname}/asp/lin-x64/driver/util/convert.exe" \
    "${pkgdir}/opt/${_pkgname}/asp/lin-x64/driver/util/starthid.exe"
  chmod -R +x \
    "${pkgdir}/opt/${_pkgname}/runtime/jreLin64/bin/" \
    "${pkgdir}/opt/${_pkgname}/runtime/jreLin64/lib/"

  install -Dm755 "${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${_pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 "opt/${_pkgname}/app/lin-x64/ico.png" \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"
  install -Dm644 "opt/${_pkgname}/app/lin-x64/LICENSE.electron.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
  install -Dm644 "opt/${_pkgname}/app/lin-x64/LICENSES.chromium.html" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
}
