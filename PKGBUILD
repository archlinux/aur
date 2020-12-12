# Maintainer: Lolix
# Contributor: TilmanV
# Contributor: Dave Blair <mail@dave-blair.de>
# Contributor: Nick Bair <njbair at gmail dot com>

pkgname=bubbleupnpserver
pkgver=0.9.38
pkgrel=2
pkgdesc="Stream content to Android devices over the Internet, requires UPNP/DNLA backend e.g. miniDLNA, Gerbera, Mediatomb"
arch=(any)
url="http://www.bubblesoftapps.com/bubbleupnpserver/"
license=('custom:BubbleUPnP Server EULA')
depends=('java-runtime-headless')
optdepends=('ffmpeg: for transcoding')
install=bubbleupnpserver.install
# http://www.bubblesoftapps.com/bubbleupnpserver2/docs/changelog.html
source=(
        launch.sh
        bubbleupnpserver.service
        bubbleupnpserver.config
        bubbleupnpserver
        "https://bubblesoftapps.com/bubbleupnpserver/core/bcprov-jdk16-146.jar"
        "https://bubblesoftapps.com/bubbleupnpserver/core/BubbleUPnPServerLauncher.jar"
        "${pkgname}-LICENCE.txt::https://bubblesoftapps.com/bubbleupnpserver/core/LICENCE.txt"
)
sha256sums=('7df801995e65a79eb5140814ca80c4caeee7e1282b69acff9e74201cbaafdaf3'
            'b99d60122343959f2118f6f74968e105d63e8ca2c8ff71efc120415378b1175a'
            '61bf63a84b839b85c0fdf0210310c94242bbb6e1aa69bf0d6c46efa013b52ae5'
            '105bfe44a43d141457bf87ef89c76a5be57f54cdb3493ae3af99c8ad6a938c36'
            'd0ae14598f9c528d2ab7bb8ed00e785a5440f692712cd362d69328aba25efb57'
            '75f31ca14d65f0e077283d15e5715636ea74c7faa0e200c5dd34e6ca50b9a06c'
            '69420fd34964ad7404efd9f19fad969f608660af85850fb90d343f2fc6eb9b48')
backup=("etc/conf.d/bubbleupnpserver.config" "var/lib/bubbleupnp/configuration.xml")

package() {

  install -d "${pkgdir}"/var/lib/bubbleupnp

  install -D -m644 "${srcdir}"/bcprov-jdk16-146.jar           "${pkgdir}"/usr/share/${pkgname}/bcprov-jdk16-146.jar
  install -D -m644 "${srcdir}"/BubbleUPnPServerLauncher.jar   "${pkgdir}"/usr/share/${pkgname}/BubbleUPnPServerLauncher.jar
  install -D -m755 "${srcdir}"/launch.sh                      "${pkgdir}"/usr/share/${pkgname}/launch.sh
  install -D -m644 "${srcdir}"/bubbleupnpserver.service       "${pkgdir}"/usr/lib/systemd/system/${pkgname}.service
  install -D -m644 "${srcdir}"/bubbleupnpserver.config        "${pkgdir}"/etc/conf.d/bubbleupnpserver.config
  install -D -m644 "${srcdir}"/bubbleupnpserver               "${pkgdir}"/etc/default/bubbleupnpserver
  install -D -m644 "${srcdir}"/${pkgname}-LICENCE.txt         "${pkgdir}"/usr/share/licenses/${pkgname}/LICENCE.txt
}
