# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@pm.me>
pkgname=postman6-bin
pkgver=6.7.4
pkgrel=1
pkgdesc="Build, test, and document your APIs faster. (Compatible with v6 team collections)"
arch=('x86_64')
url="https://learning.getpostman.com/docs/postman_pro/managing_postman_pro/migrating_to_v7/#team-user-on-v7"
license=('custom')
source=(
	"$pkgname-$pkgver.tar.gz::https://dl.pstmn.io/download/version/${pkgver}/linux64"
    "postman6.desktop"
)
md5sums=('86d8b577e90a61949750b393097577c8'
         'fb0374754495c7c8c61b25dec799b3e2')
depends=(gconf libxss gtk2 libxtst nss alsa-lib)
package() {
	install -dm755 "${pkgdir}/opt/"
	chmod -R 755 "Postman"
	cp -r "Postman" "${pkgdir}/opt/postman6"
	chmod -R 755 "${pkgdir}/opt/postman6"
  	install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/postman6/Postman" "${pkgdir}/usr/bin/postman6"
    # License
    install -D -m644 "Postman/app/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    # Chromium License
    install -D -m644 "Postman/app/LICENSES.chromium.html" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
    # Desktop file
    install -D -m644 "postman6.desktop" \
        "${pkgdir}/usr/share/applications/postman6.desktop"
    # Icon
    install -d -m755 "${pkgdir}/usr/share/icons/hicolor/128x128/apps"
    ln -s "/opt/postman/app/resources/app/assets/icon.png" \
        "${pkgdir}/usr/share/icons/hicolor/128x128/apps/postman6.png"
}
