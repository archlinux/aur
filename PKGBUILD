# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=musiko-bin
pkgver=1.0.8
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
sha256sums=('96b6aa0f02d3cacd6c83943ec7a92762333ae1e9e1c473c40d7f9430e055b5bf')

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
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/opt"
  cp -avR squashfs-root/ "${pkgdir}/opt/${pkgname%-bin}"
  ln -s /opt/${pkgname%-bin}/AppRun "${pkgdir}/usr/bin/${pkgname%-bin}"
  find "${pkgdir}/opt/${pkgname%-bin}" -type d -exec chmod 755 {} +
}
# vim:set ts=2 sw=2 et: