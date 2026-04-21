# Maintainer: Tháles de Oliveira <oliveiraethales@gmail.com>
pkgname=torrential
pkgver=0.1.0
pkgrel=1
pkgdesc='A sleek Linux TIDAL client with Hi-Res FLAC support (24-bit/192kHz)'
arch=('x86_64')
url='https://github.com/oliveiraethales/torrential'
license=('MIT')
depends=('gtk3' 'mpv')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/oliveiraethales/torrential/releases/download/v${pkgver}/torrential-${pkgver}-linux-x86_64.tar.gz")
sha256sums=('39d538ce4af803ecf84c59cfefaa4b818a8dcda8ab074b364e43539f1d668721')

package() {
  cd "${pkgname}-${pkgver}-linux-x86_64"

  # Install application binary and data
  install -d "${pkgdir}/opt/${pkgname}"
  cp -r torrential data lib "${pkgdir}/opt/${pkgname}/"

  # Create /usr/bin symlink
  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/torrential" "${pkgdir}/usr/bin/torrential"

  # Install desktop file
  install -Dm644 com.torrential.torrential.desktop \
    "${pkgdir}/usr/share/applications/com.torrential.torrential.desktop"

  # Fix Exec path in desktop file
  sed -i 's|Exec=torrential|Exec=/opt/torrential/torrential|' \
    "${pkgdir}/usr/share/applications/com.torrential.torrential.desktop"

  # Install icons
  for size in 16 32 48 64 128 256 512; do
    install -Dm644 "icons/hicolor/${size}x${size}/apps/com.torrential.torrential.png" \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/com.torrential.torrential.png"
  done
}
