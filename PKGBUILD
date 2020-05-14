# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=musiko-bin
pkgver=1.0.6
pkgrel=1
pkgdesc='A free to use, open source and cross platform music player'
arch=('x86_64')
url='https://bitbucket.org/diatomee/musiko'
license=('custom:unknown')
depends=('zlib')
provides=('musiko')
options=('!strip')
makedepends=('gendesk')
source=("${pkgname}-${pkgver}.AppImage::https://bitbucket.org/diatomee/musiko/downloads/Musiko-${pkgver}.AppImage")
sha256sums=('0dfe2a41f0ca1f97fea2b29c7b21579ebe6f52dc1e1d7cdcbd65b5c90967f889')

package() {
  chmod 755 ./${pkgname}-${pkgver}.AppImage
  ./${pkgname}-${pkgver}.AppImage --appimage-extract
  install -Dm644 squashfs-root/musiko.png -t "${pkgdir}/usr/share/pixmaps"
  gendesk -f -n --pkgname "${pkgname%-bin}" \
          --pkgdesc "$pkgdesc" \
          --name "Musiko" \
          --comment "$pkgdesc" \
          --exec "${pkgname%-bin}" \
          --categories 'Utility;Audio;AudioVideo' \
          --icon "${pkgname%-bin}"
  install -Dm644 "${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/opt/${pkgname%-bin}" "${pkgdir}/usr/bin"
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}.AppImage" -t "${pkgdir}/opt/${pkgname%-bin}/"
  ln -s /opt/musiko/${pkgname}-${pkgver}.AppImage "${pkgdir}/usr/bin/musiko"
}
# vim:set ts=2 sw=2 et: