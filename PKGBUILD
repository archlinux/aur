# Maintainer: Dan Fuhry <dan@fuhry.com>
pkgname=megalogviewer
pkgver=4.5.05
pkgrel=1
pkgdesc="Viewer for TunerStudio/MegaSquirt logs"
arch=(any)
depends=(java-runtime)
makedepends=(imagemagick)
license=(proprietary)
source=(http://www.tunerstudio.com/downloads2/MegaLogViewerHD_v${pkgver}.tar.gz
		megalogviewer.sh
		megalogviewer.desktop
		)
sha256sums=('99e8e8df9465d1ed89d8593d518955e72eff9f1c3ee5fae62ef9ef9abd89d034'
            'fa7f28b0b9363fd535d596e861a2f4c2708949d724e41c365aeb0058e51fe4a2'
            '6c6238646f60a076ebe0549228b59d7d9f20bc7019a0e7d8b5df2089ba50a396')

build()
{
	convert "${srcdir}/MegaLogViewerHD/MegaLogViewer.ico" -alpha set "${srcdir}/MegaLogViewerHD/megalogviewer.png"
	chmod -R a+rX "${srcdir}/MegaLogViewerHD"
}

package()
{
	for icon in ${srcdir}/MegaLogViewerHD/megalogviewer-*.png; do
		size=$(identify -format '%wx%h' "${icon}")
		mkdir -p "${pkgdir}/usr/share/icons/hicolor/${size}/apps"
		install -m644 "$icon" "${pkgdir}/usr/share/icons/hicolor/${size}/apps/${pkgname}.png"
		rm -f "$icon"
	done
	mkdir -p "${pkgdir}/usr/lib"
	cp -a "${srcdir}/MegaLogViewerHD" "${pkgdir}/usr/lib/megalogviewer"
	chmod 0755 "${pkgdir}/usr/lib/megalogviewer"
	
	mkdir -p "${pkgdir}/usr/bin"
	install -m755 "${srcdir}/megalogviewer.sh" "${pkgdir}/usr/bin/megalogviewer"
	
	mkdir -p "${pkgdir}/usr/share/applications"
	install -m644 "${srcdir}/megalogviewer.desktop" "${pkgdir}/usr/share/applications/megalogviewer.desktop"
}
