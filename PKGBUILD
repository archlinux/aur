# Maintainer: robserob <robin at robserob.dk>
pkgname=vpin-studio-client-bin
pkgver=5.1.7
pkgrel=1
pkgdesc="Client to connect to Vpin Studio servers, an open source pinball cabinet manager"
arch=('x86_64')
url="https://github.com/syd711/vpin-studio"
license=('MIT')
depends=('zulu-jre25-fx')
makedepends=('unzip' 'cmake')
source=("${pkgname}-${pkgver}.zip::https://github.com/syd711/vpin-studio/releases/download/${pkgver}/VPin-Studio-Client-linux-x64.zip"
	      "vpin-studio-client.desktop"
	      "vpin-studio.png"
  	    "launcher.sh"
        "license.txt")
sha256sums=('affe762f5511beca29ef33a830a2ef4b7f34c471699e65ce69469c595461c055'
            'da677687ce26ee9c7da8c9282254f73a2756174047d6683357f3d9b2045aef89'
            '2561ca46d2104ca5bed1e52df71520b51b10e2467b436a5dc50a5a9b46edb879'
            'c39e041cb54c5f210119a4d89546cb1c202d58943b31ba34cec9f0ff42d299be'
            'b69ce1302dc90df90637db38163ee1becbe556b316a52c0eaaf7f82cd6fbe765')

package() {
  mkdir -p "${pkgdir}/opt/${pkgname}"
  mkdir -p "${pkgdir}/usr/share/applications"

  chmod +x "${srcdir}/launcher.sh"

  mv "${srcdir}/launcher.sh" "${pkgdir}/opt/${pkgname}"
  mv "${srcdir}/vpin-studio-ui.jar" "${pkgdir}/opt/${pkgname}"
  mv "${srcdir}/resources" "${pkgdir}/opt/${pkgname}/resources"
  
  install -m 0644 -p license.txt -D "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
  install -Dm 644 "${srcdir}/vpin-studio.png"  "${pkgdir}/usr/share/icons/hicolor/512x512/apps/vpin-studio.png"
  install -Dm 644 "${srcdir}/vpin-studio-client.desktop"			"${pkgdir}/usr/share/applications/vpin-studio-client.desktop"
}  # package

post_install() {
  gtk-update-icon-cache -q -t -f /usr/share/icons/hicolor
}

post_remove() {
  gtk-update-icon-cache -q -t -f /usr/share/icons/hicolor
}
