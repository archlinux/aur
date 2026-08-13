# Maintainer: Bernardo Pinto Gomes <bernardopgomes@hotmail.com>
pkgname=streamworks-bin
pkgver=1.7.0
pkgrel=1
pkgdesc='Streaming Hub local-first para desktop, web e operações'
arch=('x86_64')
url='https://gitlab.com/bernardopg/streamworks-releases'
license=('MIT')
depends=(
  'alsa-lib'
  'fuse2'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'mesa'
  'nss'
  'zlib'
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
# Every size below is declared in the hicolor index.theme. Shipping a single
# size leaves the launcher upscaling one bitmap; shipping a size outside the
# theme index makes the lookup fail and fall back to a generic icon.
_icon_sizes=(16 22 24 32 48 64 72 96 128 192 256 512)
validpgpkeys=('BAA02ADB0110F341143B612200142FAC7F3B52D9') # StreamWorks Release
source=(
  "streamworks-${pkgver}.AppImage::${_release_base}/v${pkgver}/downloads/StreamWorks-Hub-${pkgver}-${CARCH}.AppImage"
  "streamworks-${pkgver}.AppImage.asc::${_release_base}/v${pkgver}/downloads/StreamWorks-Hub-${pkgver}-${CARCH}.AppImage.asc"
  'streamworks.desktop'
  'LICENSE'
  'streamworks-16.png'
  'streamworks-22.png'
  'streamworks-24.png'
  'streamworks-32.png'
  'streamworks-48.png'
  'streamworks-64.png'
  'streamworks-72.png'
  'streamworks-96.png'
  'streamworks-128.png'
  'streamworks-192.png'
  'streamworks-256.png'
  'streamworks-512.png'
)
sha256sums=(
  '6dcdb2393a5cc0a6e841c59aef3a4f11ccd7da54cc4aacdb944bb38b2d9a79b7'
  'SKIP'
  'acc50f91fb906893da66db639a7be7b6eb16869f4a72bedcff4be5c3f507dc15'
  'adb5560313a4503a634ac61dc73d397be6b3fa39603bc51ed0151dc36fdad943'
  '6c255f25cf7756399b0e8b1911ed9315c47d35f9ab367688bb58aa900e15a08a'
  'e5ecb57bb29e572621e00c6fa2478f0d88055dcb2521059be3731e52fa5848bc'
  'e8f6b24280e47dfdf5bce7e97577ae8c1e7ad2017b35a485f2c6ae48f743d352'
  '22f871ed71f566e5f3cd0fd3a507ce3c31217207c6251a8a7e64d2aa9db5c30a'
  'c5ced1571d3e78a046ae9f48a183020bd7083afa4d1b51d40ba3205dae806dad'
  '0e65146883bc3ade7e79fb0ce9f329cac86b193034b6223dcdda4ec84c98f289'
  '16b69cfb892e69a03c8903386445371f18b25cdb85cebe6a204400fd0a895e79'
  'afbec1e744e0b21147f100cd15ff131a51ed8403923178b17e3b6f87642695ee'
  '31651ccdc061ac7116db2c04f06326b0a66235b54e81402cb0601cba6c632d28'
  'a1bb90a8dc52cf23b4a03c5fd6bcb37afdde9aada042ae0e00f5f3be8fe72b84'
  '76aa047aa76802f7fb7e33b19c66bce73f8d292893cea7261135fe7513794ec1'
  '85ef88a84b6cfac9832324d32e6c1c9aa3adf930bbf7072783e57e459ebedf1a'
)

package() {
  install -Dm755 "${srcdir}/streamworks-${pkgver}.AppImage" \
    "${pkgdir}/usr/lib/streamworks/StreamWorks-Hub.AppImage"
  install -Dm644 "${srcdir}/streamworks.desktop" \
    "${pkgdir}/usr/share/applications/streamworks.desktop"
  local _size
  for _size in "${_icon_sizes[@]}"; do
    install -Dm644 "${srcdir}/streamworks-${_size}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/streamworks.png"
  done
  install -Dm644 "${srcdir}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -d "${pkgdir}/usr/bin"
  ln -s /usr/lib/streamworks/StreamWorks-Hub.AppImage \
    "${pkgdir}/usr/bin/streamworks-hub"
  ln -s /usr/lib/streamworks/StreamWorks-Hub.AppImage \
    "${pkgdir}/usr/bin/streamworks"
}
