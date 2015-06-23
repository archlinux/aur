# Maintainer: Ben Alex <ben.alex@acegi.com.au>

pkgname=ib-tws
pkgver=950.2g
pkgrel=1
pkgdesc='Electronic trading platform from discount brokerage firm Interactive Brokers'
arch=('any')
url="http://interactivebrokers.com/"
license=('custom')
depends=(java-environment bash)
makedepends=(imagemagick)

source=('LICENSE'
	'ib-tws'
	'ib-tws.desktop'
	'ib-gw'
	'ib-gw.desktop'
	'http://download2.interactivebrokers.com/download/unixmacosx_latest.jar')

md5sums=('e1cae2de592add7133bb08123e8db1ad'
         'c407d22dfafdb33ec2fe97eeb5e9f0aa'
         '9205b5eade96d69f8e470cc52c30db4a'
         'c95eeb41fec3aae6ad5e82703a39060c'
         'ffa9fcfb623850e5c9e796040bdbd052'
         'ac44e5900c36629b0a432305947b7f4a')

build() {
	# Thanks to http://finance.groups.yahoo.com/group/TWSAPI/files/RPM%20spec%20file/
	cd ${srcdir}/IBJts
	jar xf jts.jar trader/common/images/ibapp_icon_48x48.gif
	jar xf jts.jar trader/common/images/quote_details_48x48.jpg
	convert trader/common/images/ibapp_icon_48x48.gif ${pkgname}.png
	convert trader/common/images/ibapp_icon_48x48.gif -resize 66.666% ${pkgname}-32x32.png
	convert trader/common/images/ibapp_icon_48x48.gif -resize 33.333% ${pkgname}-16x16.png
	convert trader/common/images/ibapp_icon_48x48.gif ${pkgname}-48x48.png
	convert trader/common/images/quote_details_48x48.jpg ib-gw.png
	convert trader/common/images/quote_details_48x48.jpg -resize 66.666% ib-gw-32x32.png
	convert trader/common/images/quote_details_48x48.jpg -resize 33.333% ib-gw-16x16.png
	convert trader/common/images/quote_details_48x48.jpg ib-gw-48x48.png
}

package() {
	cd ${srcdir}
	mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
	install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
	install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
	install -Dm755 ib-gw ${pkgdir}/usr/bin/ib-gw
	install -Dm644 ${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
	install -Dm644 ib-gw.desktop ${pkgdir}/usr/share/applications/ib-gw.desktop
	cd ${srcdir}/IBJts
	mkdir -p ${pkgdir}/usr/share/pixmaps/
	install -Dm644 *.png "${pkgdir}/usr/share/pixmaps/"
	mkdir -p ${pkgdir}/usr/share/java/${pkgname}
	install -Dm644 *.jar ${pkgdir}/usr/share/java/${pkgname}
	install -Dm644 *.ini ${pkgdir}/usr/share/java/${pkgname}
}
