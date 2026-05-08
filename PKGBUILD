# Maintainer: robserob <robin at robserob.dk>
pkgname=vpin-studio-client-bin
pkgver=4.9.0
pkgrel=1
pkgdesc="Client to connect to Vpin Studio servers, an open source pinball cabinet manager"
arch=('x86_64')
url="https://github.com/syd711/vpin-studio"
license=('MIT')
depends=('zulu11-fx-bin')
makedepends=('unzip' 'cmake')
source=("${pkgname}-${pkgver}.zip::https://github.com/syd711/vpin-studio/releases/download/${pkgver}/VPin-Studio-Client-linux-x64.zip"
	      "vpin-studio-client.desktop"
	      "vpin-studio.png"
  	    "launcher.sh"
        "license.txt")
sha256sums=('7f3b406709ba2aab215a74cb52b18b9275af0b1844ecca7fefe0e9da96b71a27'
            'da677687ce26ee9c7da8c9282254f73a2756174047d6683357f3d9b2045aef89'
            '2561ca46d2104ca5bed1e52df71520b51b10e2467b436a5dc50a5a9b46edb879'
            '233136d6c651522ffa4ae591493916a1c8507d673e4d95204d86f31667901c5e'
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
