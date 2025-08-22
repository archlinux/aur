# Maintainer: Spark Xia <legion_REMOVE_THIS_20220808&#64;gmail&#46;com>
pkgname=longbridge-pro
pkgver=0.5.1        # upstream "v0.5.0"
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
  "https://pub.lbkrs.com/files/202211/yyY2XRM5auoPCXfy/LBPL-Platform_TnCs__31_Oct_2022-FINAL_.pdf"
)
sha256sums=(
  '39187bc21561415b1208aec73e90d9501624d74ecb9a9a4bb59fc2bd8cf994cf' # .deb
  'd647a1375a54e3a51670cda6f3f6b9f1e878b7d62b44af1bcf376c1a42230148' # EULA
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

  install -Dm644 ./LBPL-Platform_TnCs__31_Oct_2022-FINAL_.pdf \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

