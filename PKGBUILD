# Maintainer: theasyncat-mvp <https://github.com/theasyncat-mvp>
pkgname=bean-asyncat-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="A local-first personal finance tracker built with Tauri"
arch=('x86_64')
url="https://github.com/theasyncat-mvp/bean"
license=('MIT')
depends=('webkit2gtk-4.1' 'libappindicator-gtk3' 'gtk3')
provides=('bean')
conflicts=('bean')

source_x86_64=("bean-${pkgver}.deb::https://github.com/theasyncat-mvp/bean/releases/download/v${pkgver}/bean_${pkgver}_amd64.deb")
sha256sums_x86_64=('SKIP')

package() {
  cd "$srcdir"

  # Extract the deb
  ar x "bean-${pkgver}.deb"
  tar xf data.tar.gz -C "${pkgdir}"

  # Rename binary from 'app' to 'bean'
  mv "${pkgdir}/usr/bin/app" "${pkgdir}/usr/bin/bean"

  # Rename icons from 'app' to 'bean'
  for size in 32x32 128x128; do
    mv "${pkgdir}/usr/share/icons/hicolor/${size}/apps/app.png" \
       "${pkgdir}/usr/share/icons/hicolor/${size}/apps/bean.png"
  done
  mv "${pkgdir}/usr/share/icons/hicolor/256x256@2/apps/app.png" \
     "${pkgdir}/usr/share/icons/hicolor/256x256@2/apps/bean.png"

  # Fix the desktop file
  sed -i 's|^Exec=app|Exec=bean|' "${pkgdir}/usr/share/applications/bean.desktop"
  sed -i 's|^Icon=app|Icon=bean|' "${pkgdir}/usr/share/applications/bean.desktop"
}
