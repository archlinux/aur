pkgname=liber-bin
pkgver=0.1.8
pkgrel=1
pkgdesc="A browser-native email client"
arch=('x86_64')
url="https://liber.sh"
license=('LicenseRef-PolyForm-Noncommercial-1.0.0')
depends=('gtk3' 'nss' 'alsa-lib')
provides=('liber')
conflicts=('liber')
options=('!strip')
source=("liber-${pkgver}-x86_64.AppImage::https://github.com/nickheyer/liber-desktop/releases/download/v${pkgver}/liber-${pkgver}-x86_64.AppImage")
sha256sums=('2b1ee0061c071bfca369f5a10314e12d00ac26e7f3095b16a72eb8c62e88a4c2')

package() {
  chmod +x "liber-${pkgver}-x86_64.AppImage"
  "./liber-${pkgver}-x86_64.AppImage" --appimage-extract >/dev/null
  install -dm755 "${pkgdir}/opt/${pkgname}"
  cp -r squashfs-root/* "${pkgdir}/opt/${pkgname}"
  chmod 4755 "${pkgdir}/opt/${pkgname}/chrome-sandbox"
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/liber" "${pkgdir}/usr/bin/liber"
  install -Dm644 squashfs-root/liber.desktop "${pkgdir}/usr/share/applications/sh.liber.Liber.desktop"
  for px in 16 24 32 48 64 128 256 512; do
    icon="squashfs-root/usr/share/icons/hicolor/${px}x${px}/apps/liber.png"
    [ -f "${icon}" ] && install -Dm644 "${icon}" "${pkgdir}/usr/share/icons/hicolor/${px}x${px}/apps/liber.png"
  done
}
