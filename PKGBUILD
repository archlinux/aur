# Maintainer: Makima0 <kekelanact@gmail.com>
pkgname=postman-bin-zh
pkgver=8.2.3
pkgrel=1
pkgdesc="Build, test, and document your APIs faster"
arch=('x86_64')
url="https://www.getpostman.com"
options=(!strip)
license=('custom')
source=(
	"Postman-linux-x64-${pkgver}.tar.gz::https://dl.pstmn.io/download/version/${pkgver}/linux64"
	"app.zip::https://github.com/hlmd/Postman-cn/releases/download/${pkgver}/app.zip"
	"postman.desktop"
)
depends=(libxss nss gtk3)
sha256sums=('b790e9d99d3b9c4dc537d7e60e51fc2007ab3951066c849f84a2ed0b28936323'
	    '83bd5a75b657737a305618d259e561f5c6c0c93de81ddea96fe42881c377f1d4'
            '74b2d8570658e207e31f729e7f4768952252383aee7c695218d077bd0ef13245')
package() {
	rm -rf Postman/app/resources/app/
	cp -r app Postman/app/resources/
	install -dm755 "${pkgdir}/opt/"
	chmod -R 755 "Postman"
	cp -r "Postman" "${pkgdir}/opt/postman"
	chmod -R 755 "${pkgdir}/opt/postman"
  	install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/postman/Postman" "${pkgdir}/usr/bin/postman"
    # License
    install -D -m644 "Postman/app/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    # Chromium License
    install -D -m644 "Postman/app/LICENSES.chromium.html" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
    # Desktop file
    install -D -m644 "postman.desktop" \
        "${pkgdir}/usr/share/applications/postman.desktop"
    # Icon
    install -d -m755 "${pkgdir}/usr/share/icons/hicolor/128x128/apps"
    ln -s "/opt/postman/app/resources/app/assets/icon.png" \
        "${pkgdir}/usr/share/icons/hicolor/128x128/apps/postman.png"
}
