# Maintainer: Dan Fuhry <dan@fuhry.com>
pkgname=tunerstudio
pkgver=3.1.03
pkgrel=1
pkgdesc="Graphical engine tuning and analysis software for Megasquirt ECUs"
arch=(any)
depends=(java-runtime)
makedepends=(imagemagick)
license=(proprietary)
source=(http://www.tunerstudio.com/downloads2/TunerStudioMS_v${pkgver}.tar.gz
		tunerstudio.sh
		tunerstudio.desktop
		)

build()
{
	convert "${srcdir}/TunerStudioMS/TSicon.ico" -alpha set "${srcdir}/TunerStudioMS/tunerstudio.png"
}

package()
{
	for icon in ${srcdir}/TunerStudioMS/tunerstudio-*.png; do
		size=$(identify -format '%wx%h' "${icon}")
		mkdir -p "${pkgdir}/usr/share/icons/hicolor/${size}/apps"
		install -m644 "$icon" "${pkgdir}/usr/share/icons/hicolor/${size}/apps/${pkgname}.png"
		rm -f "$icon"
	done
	mkdir -p "${pkgdir}/usr/lib"
	cp -a "${srcdir}/TunerStudioMS" "${pkgdir}/usr/lib/tunerstudio"
	
	mkdir -p "${pkgdir}/usr/bin"
	install -m755 "${srcdir}/tunerstudio.sh" "${pkgdir}/usr/bin/tunerstudio"
	
	mkdir -p "${pkgdir}/usr/share/applications"
	install -m644 "${srcdir}/tunerstudio.desktop" "${pkgdir}/usr/share/applications/tunerstudio.desktop"
}
sha256sums=('fc668259bff1da96d1b4aa6768b94fd1be4fa86778911919c91d2a8492507333'
            'e787c1df189a86b54c16ce6a4e49fcecfe91dbf4f58ee0c3d7887de1ac1fe418'
            'a493f95c6b311c9a3be3cdd6a06462f9bdd9c10905e73825a085339abd3eee6b')
