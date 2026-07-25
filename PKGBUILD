# Maintainer: Bernardo Pinto Gomes <bernardopgomes@hotmail.com>
pkgname=streamworks-bin
pkgver=1.1.13
pkgrel=1
pkgdesc='Streaming Hub local-first para desktop, web e operações'
arch=('x86_64')
url='https://gitlab.com/bernardopg/streamworks-releases'
license=('MIT')
depends=(
  'alsa-lib'
  'fuse2'
  'gtk3'
  'mesa'
  'nss'
)
optdepends=(
  'ffmpeg: transcode e compatibilidade de codecs'
  'mpv: reprodução externa e fallback de diagnóstico'
  'tor: validação de listas por proxy Tor'
)
provides=("streamworks=${pkgver}" "streamworks-hub=${pkgver}")
conflicts=('streamworks' 'streamworks-hub')
options=('!strip' '!debug')

_release_base='https://gitlab.com/bernardopg/streamworks-releases/-/releases'
validpgpkeys=('BAA02ADB0110F341143B612200142FAC7F3B52D9') # StreamWorks Release
source=(
  "streamworks-${pkgver}.AppImage::${_release_base}/v${pkgver}/downloads/StreamWorks-Hub-${pkgver}-${CARCH}.AppImage"
  "streamworks-${pkgver}.AppImage.asc::${_release_base}/v${pkgver}/downloads/StreamWorks-Hub-${pkgver}-${CARCH}.AppImage.asc"
  'streamworks.desktop'
  'streamworks.png'
  'LICENSE'
)
sha256sums=(
  'd8d7020c4d626ee110f00c2a3bdbf6ec4800dce59a5989b3e6b0348d5dde1a7c'
  'SKIP'
  'b16cbd1509cf60176598d0629780a2688b9972d985eb6805b2984008018580d0'
  '31651ccdc061ac7116db2c04f06326b0a66235b54e81402cb0601cba6c632d28'
  'adb5560313a4503a634ac61dc73d397be6b3fa39603bc51ed0151dc36fdad943'
)

package() {
  install -Dm755 "${srcdir}/streamworks-${pkgver}.AppImage" \
    "${pkgdir}/usr/lib/streamworks/StreamWorks-Hub.AppImage"
  install -Dm644 "${srcdir}/streamworks.desktop" \
    "${pkgdir}/usr/share/applications/streamworks.desktop"
  install -Dm644 "${srcdir}/streamworks.png" \
    "${pkgdir}/usr/share/icons/hicolor/128x128/apps/streamworks.png"
  install -Dm644 "${srcdir}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -d "${pkgdir}/usr/bin"
  ln -s /usr/lib/streamworks/StreamWorks-Hub.AppImage \
    "${pkgdir}/usr/bin/streamworks-hub"
  ln -s /usr/lib/streamworks/StreamWorks-Hub.AppImage \
    "${pkgdir}/usr/bin/streamworks"
}
