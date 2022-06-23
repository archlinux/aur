# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: TilmanV
# Contributor: Dave Blair <mail@dave-blair.de>
# Contributor: Nick Bair <njbair at gmail dot com>

pkgname=bubbleupnpserver
pkgver=0.9.43
pkgrel=1
pkgdesc="Stream content to Android devices over the Internet, requires UPNP/DNLA backend e.g. miniDLNA, Gerbera, Mediatomb"
arch=(any)
url="https://www.bubblesoftapps.com/bubbleupnpserver2/"
license=('custom:BubbleUPnP Server EULA')
depends=('java-runtime-headless')
optdepends=('ffmpeg: for transcoding')
install=bubbleupnpserver.install
# http://www.bubblesoftapps.com/bubbleupnpserver2/docs/changelog.html
source=(
        bubbleupnpserver.sh
        bubbleupnpserver.service
        bubbleupnpserver.config
        bubbleupnpserver-sysuser.conf
        bubbleupnpserver
        #"https://bubblesoftapps.com/bubbleupnpserver/core/bcprov-jdk16-146.jar"
        #"https://bubblesoftapps.com/bubbleupnpserver/core/BubbleUPnPServerLauncher.jar"
        "BubbleUPnPServer-distrib-$(date +%F-%H).zip::https://bubblesoftapps.com/bubbleupnpserver/BubbleUPnPServer-distrib.zip"
        "${pkgname}-LICENCE.txt::https://bubblesoftapps.com/bubbleupnpserver/core/LICENCE.txt"
)
sha256sums=('7df801995e65a79eb5140814ca80c4caeee7e1282b69acff9e74201cbaafdaf3'
            'b99d60122343959f2118f6f74968e105d63e8ca2c8ff71efc120415378b1175a'
            '61bf63a84b839b85c0fdf0210310c94242bbb6e1aa69bf0d6c46efa013b52ae5'
            'fd764bb4c785ab0e2481d26f4f30656ba756949afa8ed949234e722ded87bf04'
            '105bfe44a43d141457bf87ef89c76a5be57f54cdb3493ae3af99c8ad6a938c36'
            '44dfe889bd86a148365641cc098bc4f7696242620b3c03c0c2dc3e9502227ba0'
            'ceb8ba5042568cd04e7c47f4e4416278bbbd1e63fe30124b0646fc90614843ba')
backup=("etc/conf.d/bubbleupnpserver.config" "var/lib/bubbleupnp/configuration.xml")

package() {

  install -d "${pkgdir}"/var/lib/bubbleupnp

  install -D -m644 bcprov-jdk16-146.jar          -t "${pkgdir}/usr/share/${pkgname}/"
  install -D -m644 BubbleUPnPServerLauncher.jar  -t "${pkgdir}/usr/share/${pkgname}/"
  install -D -m755 "${srcdir}"/bubbleupnpserver.sh            "${pkgdir}/usr/share/${pkgname}/launch.sh"
  install -D -m644 "${srcdir}"/bubbleupnpserver.service       "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -D -m644 "${srcdir}"/bubbleupnpserver.config        "${pkgdir}/etc/conf.d/bubbleupnpserver.config"
  install -D -m644 "${srcdir}"/bubbleupnpserver-sysuser.conf  "${pkgdir}/usr/lib/sysusers.d/bubbleupnpserver.conf"
  install -D -m644 "${srcdir}"/bubbleupnpserver               "${pkgdir}/etc/default/bubbleupnpserver"
  install -D -m644 "${srcdir}/${pkgname}-LICENCE.txt"         "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE.txt"
}
