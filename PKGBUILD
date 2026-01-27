# Maintainer: robertfoster
pkgname=arubasign-bin
pkgver=25.0.17
pkgrel=1
pkgdesc="Suite di Firma Digitale Aruba per firmare e verificare documenti con certificati X.509"
arch=('x86_64')
url="https://www.pec.it/Download.aspx"
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
provides=('arubasign')
conflicts=('arubasign')
options=('!strip')
source=("ArubaSign-${pkgver}.tar.bz2::https://updatesfirma.aruba.it/downloads/ArubaSign-latest-LINUX.tar.bz2"
  "${pkgname%-bin}.sh"
  "${pkgname%-bin}.desktop")
sha256sums=('6011b8193fd8039d8bb13b5d01f9108f6dec6a0aeed460a6c815e9f532e39d68'
  '44d5a13f18d60851de6c71d4a336a54a90f9a1f2b82813e52e685c22e46ac6d2'
  '4faa020d89f19c5f9f5c3cc5301c8a6f00cf12a769f0e4a4cd1f0cec73c864f9')

package() {
  cd "$srcdir"

  # Create install directories
  install -dm755 "${pkgdir}/opt/${pkgname%-bin}"
  install -dm755 "${pkgdir}/usr/bin"
  install -dm755 "${pkgdir}/usr/share/applications"
  install -dm755 "${pkgdir}/usr/share/icons/hicolor/256x256/apps"
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"

  # Copy application files
  cp -r app "${pkgdir}/opt/${pkgname%-bin}/"
  cp -r asp "${pkgdir}/opt/${pkgname%-bin}/"
  cp -r runtime "${pkgdir}/opt/${pkgname%-bin}/"
  cp -r users "${pkgdir}/opt/${pkgname%-bin}/"
  cp -r .registry "${pkgdir}/opt/${pkgname%-bin}/"
  cp ApkgTool "${pkgdir}/opt/${pkgname%-bin}/"

  # Set permissions
  chmod +x "${pkgdir}/opt/${pkgname%-bin}/app/lin-x64/ArubaSign"
  chmod +x "${pkgdir}/opt/${pkgname%-bin}/app/lin-x64/arubasign.bat"
  chmod +x "${pkgdir}/opt/${pkgname%-bin}/app/lin-x64/chrome_crashpad_handler"
  chmod +x "${pkgdir}/opt/${pkgname%-bin}/app/lin-x64/chrome-sandbox"
  chmod +x "${pkgdir}/opt/${pkgname%-bin}/asp/lin-x64/ArubaSignPlatform.exe"
  chmod +x "${pkgdir}/opt/${pkgname%-bin}/asp/lin-x64/driver/util/convert.exe"
  chmod +x "${pkgdir}/opt/${pkgname%-bin}/asp/lin-x64/driver/util/starthid.exe"
  chmod +x "${pkgdir}/opt/${pkgname%-bin}/ApkgTool"
  chmod -R +x "${pkgdir}/opt/${pkgname%-bin}/runtime/jreLin64/bin/"
  chmod -R +x "${pkgdir}/opt/${pkgname%-bin}/runtime/jreLin64/lib/"

  # Install launcher script
  install -Dm755 "${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"

  # Install desktop file
  install -Dm644 "${pkgname%-bin}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"

  # Install icon
  install -Dm644 "app/lin-x64/ico.png" \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname%-bin}.png"

  # Install license
  install -Dm644 "app/no-arch/license.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
