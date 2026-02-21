# Maintainer: theasyncat-mvp <https://github.com/theasyncat-mvp>
pkgname=tempo-asyncat-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="A Pomodoro focus timer built with Tauri"
arch=('x86_64')
url="https://github.com/theasyncat-mvp/tempo"
license=('MIT')
depends=('webkit2gtk-4.1' 'libappindicator-gtk3' 'gtk3')
provides=('tempo')
conflicts=('tempo')

source_x86_64=("tempo-${pkgver}.deb::https://github.com/theasyncat-mvp/tempo/releases/download/v${pkgver}/tempo_${pkgver}_amd64.deb")
sha256sums_x86_64=('SKIP')

package() {
  cd "$srcdir"

  # Extract the deb
  ar x "tempo-${pkgver}.deb"
  tar xf data.tar.gz -C "${pkgdir}"

  # Rename binary from 'app' to 'tempo'
  mv "${pkgdir}/usr/bin/app" "${pkgdir}/usr/bin/tempo"

  # Rename icons from 'app' to 'tempo'
  for size in 32x32 128x128; do
    mv "${pkgdir}/usr/share/icons/hicolor/${size}/apps/app.png" \
       "${pkgdir}/usr/share/icons/hicolor/${size}/apps/tempo.png"
  done
  mv "${pkgdir}/usr/share/icons/hicolor/256x256@2/apps/app.png" \
     "${pkgdir}/usr/share/icons/hicolor/256x256@2/apps/tempo.png"

  # Fix the desktop file to point to the renamed binary and icon
  sed -i 's|^Exec=app|Exec=tempo|' "${pkgdir}/usr/share/applications/tempo.desktop"
  sed -i 's|^Icon=app|Icon=tempo|' "${pkgdir}/usr/share/applications/tempo.desktop"
}
