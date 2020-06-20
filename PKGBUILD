# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=querypie
pkgver=6.2.0
pkgrel=1
pkgdesc="The most advanced Data Warehouse Client for data analytics teams.
Optimized for Snowflake, Presto, BigQuery, and Redshift"
arch=('x86_64')
url='https://www.querypie.com'
license=('custom:${pkgname}')
depends=('zlib')
options=('!strip')
noextract=("${pkgname}-${pkgver}.AppImage")
source=("${pkgname}-${pkgver}.AppImage::https://d2f8621kw7pn7s.cloudfront.net/latest/QueryPie-${pkgver}.AppImage?v=${pkgver}-latest.200615184"
        'LICENSE')
sha256sums=('097e3130bd4efb1aeeebd75f5d2d6f187df8e3092850c36f9be43604ef99ffab'
            'SKIP')

package() {
  chmod 755 ./${pkgname}-${pkgver}.AppImage
  ./${pkgname}-${pkgver}.AppImage --appimage-extract
  install -Dm644 squashfs-root/usr/share/icons/hicolor/256x256/apps/querypie.png "${pkgdir}/usr/share/pixmaps/querypie.png"
  gendesk -f -n --pkgname "${pkgname}" \
          --pkgdesc "$pkgdesc" \
          --name "QueryPie" \
          --comment "$pkgdesc" \
          --exec "${pkgname}" \
          --categories 'Utility;Development;Application;' \
          --icon "${pkgname}" \
          --mimetypes=x-scheme-handler/querypie; \
  install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/bin"
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}.AppImage" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s /opt/${pkgname}/${pkgname}.AppImage "${pkgdir}/usr/bin/querypie"
}