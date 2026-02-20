# Maintainer: theasyncat-mvp <https://github.com/theasyncat-mvp>
pkgname=stash-asyncat-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="A bookmark manager built with Tauri"
arch=('x86_64')
url="https://github.com/theasyncat-mvp/Stash"
license=('MIT')
depends=('webkit2gtk-4.1' 'libappindicator-gtk3' 'gtk3')
provides=('stash')
conflicts=('stash')

source_x86_64=("stash-${pkgver}.deb::https://github.com/theasyncat-mvp/Stash/releases/download/v${pkgver}/Stash_${pkgver}_amd64.deb")
sha256sums_x86_64=('SKIP')

package() {
  cd "$srcdir"

  # Extract the deb
  ar x "stash-${pkgver}.deb"
  tar xf data.tar.gz -C "${pkgdir}"

  # Rename binary from 'app' to 'stash'
  mv "${pkgdir}/usr/bin/app" "${pkgdir}/usr/bin/stash"

  # Rename icons from 'app' to 'stash'
  for size in 32x32 128x128; do
    mv "${pkgdir}/usr/share/icons/hicolor/${size}/apps/app.png" \
       "${pkgdir}/usr/share/icons/hicolor/${size}/apps/stash.png"
  done
  mv "${pkgdir}/usr/share/icons/hicolor/256x256@2/apps/app.png" \
     "${pkgdir}/usr/share/icons/hicolor/256x256@2/apps/stash.png"

  # Fix the desktop file to point to the renamed binary and icon
  sed -i 's|^Exec=app|Exec=stash|' "${pkgdir}/usr/share/applications/Stash.desktop"
  sed -i 's|^Icon=app|Icon=stash|' "${pkgdir}/usr/share/applications/Stash.desktop"
}
