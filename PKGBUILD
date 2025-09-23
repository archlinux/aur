# Maintainer: Spark Xia <legion_REMOVE_THIS_20220808&#64;gmail&#46;com>
pkgname=longbridge-pro
pkgver=0.7.0        # upstream "v0.6.0"
pkgrel=1
pkgdesc="Longbridge Pro – professional trading platform"
arch=('x86_64')
options=('!emptydirs' '!debug')
license=('LicenseRef-Longbridge-Proprietary')
url="https://longbridge.com/desktop"
depends=(
  'webkit2gtk-4.1' 'alsa-lib' 
)
source=(
  "https://assets.lbctrl.com/github/release/longbridge-desktop/stable/longbridge-v${pkgver}-linux-x86_64.deb"
  "https://pub.lbkrs.com/static/offline/202508/FN9DnQt1WuLR5Wmz/LBPL_Platform_TnCs_3_December_2024.pdf"
)
sha256sums=(
  '9d746e9ce96100255d2e570c8c7e3006614501d1c732c610ec6b8234501f80f4' # .deb
  'c7ed0deafa4570da6fd7d173f8be759645673ee55d3a41ef9473e0d6658ad231' # EULA
)

prepare() {
  bsdtar -xf "longbridge-v${pkgver}-linux-x86_64.deb"
  bsdtar -xf data.tar.zst
}

package() {

  install -Dm755 usr/local/bin/longbridge \
    "${pkgdir}/usr/bin/longbridge"

  # # Symlink launcher
  # install -d "${pkgdir}/usr/bin"
  # ln -s "/opt/${pkgname}/bin/longbridge" "${pkgdir}/usr/bin/longbridge-pro"

  # Desktop entry & icons
  install -Dm644 usr/share/applications/longbridge.desktop \
    "${pkgdir}/usr/share/applications/longbridge.desktop"
  install -Dm644 usr/share/icons/hicolor/512x512/apps/longbridge.png \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/longbridge.png"
  install -Dm644 usr/share/icons/hicolor/1024x1024/apps/longbridge.png \
    "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/longbridge.png"

  install -Dm644 ./LBPL_Platform_TnCs_3_December_2024.pdf \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

