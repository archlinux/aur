# Maintainer: coleisforrobot <coleisforrobot at proton dot me>
pkgname=wiilink-patcher-bin
pkgver=1.5.3
pkgrel=1
pkgdesc="Qt application to patch WiiLink servers into WiiConnect24 channels (pre-compiled)"
arch=('x86_64' 'aarch64')
url="https://github.com/WiiLink24/WiiLink-Patcher-GUI"
license=('MPL-2.0')
options=('!strip' '!debug')
depends=('glibc' 'hicolor-icon-theme')
provides=("wiilink-patcher=${pkgver}")
conflicts=('wiilink-patcher')

source=(
  "${pkgname}-${pkgver}-${pkgrel}.ca.wiilink.Patcher.desktop::https://raw.githubusercontent.com/WiiLink24/WiiLink-Patcher-GUI/v${pkgver}/flatpak/ca.wiilink.Patcher.desktop"
  "${pkgname}-${pkgver}-${pkgrel}.16x16.png::https://raw.githubusercontent.com/WiiLink24/WiiLink-Patcher-GUI/v${pkgver}/flatpak/icons/16x16.png"
  "${pkgname}-${pkgver}-${pkgrel}.32x32.png::https://raw.githubusercontent.com/WiiLink24/WiiLink-Patcher-GUI/v${pkgver}/flatpak/icons/32x32.png"
  "${pkgname}-${pkgver}-${pkgrel}.48x48.png::https://raw.githubusercontent.com/WiiLink24/WiiLink-Patcher-GUI/v${pkgver}/flatpak/icons/48x48.png"
  "${pkgname}-${pkgver}-${pkgrel}.64x64.png::https://raw.githubusercontent.com/WiiLink24/WiiLink-Patcher-GUI/v${pkgver}/flatpak/icons/64x64.png"
  "${pkgname}-${pkgver}-${pkgrel}.128x128.png::https://raw.githubusercontent.com/WiiLink24/WiiLink-Patcher-GUI/v${pkgver}/flatpak/icons/128x128.png"
  "${pkgname}-${pkgver}-${pkgrel}.256x256.png::https://raw.githubusercontent.com/WiiLink24/WiiLink-Patcher-GUI/v${pkgver}/flatpak/icons/256x256.png"
  "${pkgname}-${pkgver}-${pkgrel}.512x512.png::https://raw.githubusercontent.com/WiiLink24/WiiLink-Patcher-GUI/v${pkgver}/flatpak/icons/512x512.png"
)
sha256sums=(
  '46e28f63495ad943b00518a7ea6059fa1dd11211b8e20d29cb28cd7403e88761'
  '61d485b0e9308d524502a8a9689e971c1024ff53e83552aed37f39e226b68a13'
  '6a2d361bcf54456e3f39db748897990584df52aac4316cdf45d5243799933fee'
  '776dc64195101f25fbef9c671432a420430a81389f23902bbfd76408462b7f63'
  '470694f8414e4f23e534bb6ee3f5e93505a567054d88fcbfbf55aa890e02e226'
  'e0daeed6d621919ce5c29910eb1221804deec0b0b94ad49baf0b80e506650f96'
  '2c1f9b9449e0bdd0602f31cc45541261487ce9b34e2f7e5cf419056629964945'
  '877ef2a91ae48fd82dd844ff14f3b27abf36baa379bae81242f561a4ac44c2db'
)

source_x86_64=("${pkgname}-${pkgver}-${pkgrel}.WiiLinkPatcherGUI-Linux-x64.tar.gz::https://github.com/WiiLink24/WiiLink-Patcher-GUI/releases/download/v${pkgver}/WiiLinkPatcherGUI-Linux-x64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-${pkgrel}.WiiLinkPatcherGUI-Linux-arm64.tar.gz::https://github.com/WiiLink24/WiiLink-Patcher-GUI/releases/download/v${pkgver}/WiiLinkPatcherGUI-Linux-arm64.tar.gz")

sha256sums_x86_64=('76f8469df7524fc0a1b59f8be39003a4839fc2500f353fcc4de34b45ac3d6cd3')
sha256sums_aarch64=('87ae70f4f2dc8b6b62635e5745f140a8d6034eeb687dc89a4931e18ce0da33b2')

prepare() {
  sed -i 's|^Exec=.*|Exec=wiilink-patcher|g' "${srcdir}/${pkgname}-${pkgver}-${pkgrel}.ca.wiilink.Patcher.desktop"
  sed -i 's|^Icon=.*|Icon=wiilink-patcher|g' "${srcdir}/${pkgname}-${pkgver}-${pkgrel}.ca.wiilink.Patcher.desktop"
}

package() {
  install -Dm755 "${srcdir}/WiiLinkPatcherGUI" "${pkgdir}/usr/bin/wiilink-patcher"
  ln -s wiilink-patcher "${pkgdir}/usr/bin/WiiLinkPatcherGUI"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-${pkgrel}.ca.wiilink.Patcher.desktop" \
    "${pkgdir}/usr/share/applications/wiilink-patcher.desktop"
  for size in 16 32 48 64 128 256 512; do
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}-${pkgrel}.${size}x${size}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/wiilink-patcher.png"
  done
}
