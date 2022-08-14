# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=quickredis
pkgver=2.7.1
pkgrel=1
pkgdesc="A free forever Redis GUI tool. It supports direct connection, sentinel, and cluster mode, supports multiple languages, supports hundreds of millions of keys and has an amazing UI"
arch=('x86_64')
url='https://quick123.net'
license=('custom:unknown')
makedepends=('gendesk')
noextract=("${pkgname}-${pkgver}.AppImage")
source=("${pkgname}-${pkgver}.AppImage::https://github.com/quick123official/quick_redis_blog/releases/download/v${pkgver}/QuickRedis-${pkgver}-linux-x86_64.AppImage")
sha256sums=('b59036bf29799e46ae322ba3f906ca4b7dab29cabf92981365c81d6ae93e97dd')

package() {
  chmod 755 ./${pkgname}-${pkgver}.AppImage
  ./${pkgname}-${pkgver}.AppImage --appimage-extract
  install -Dm644 squashfs-root/usr/share/icons/hicolor/512x512/apps/quickredis.png "${pkgdir}/usr/share/pixmaps/quickredis.png"
  gendesk -f -n --pkgname "${pkgname}" \
          --pkgdesc "$pkgdesc" \
          --name "QuickRedis" \
          --comment "$pkgdesc" \
          --exec "${pkgname}" \
          --categories 'Utility;Development;Application' \
          --icon "${pkgname}"
  install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/opt"
  cp -avR squashfs-root/ "${pkgdir}/opt/${pkgname}"
  ln -s /opt/${pkgname}/AppRun "${pkgdir}/usr/bin/quickredis"
  find "${pkgdir}/opt/${pkgname}" -type d -exec chmod 755 {} +
}
