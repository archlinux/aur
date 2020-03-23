# Maintainer: Dan Fuhry <dan@fuhry.com>
pkgname=megalogviewer
pkgver=4.4.03
pkgrel=1
pkgdesc="Viewer for TunerStudio/MegaSquirt logs"
arch=(any)
depends=(java-runtime)
makedepends=(imagemagick)
license=(proprietary)
source=(http://www.tunerstudio.com/downloads2/MegaLogViewer_v${pkgver}.tar.gz
		megalogviewer.sh
		megalogviewer.desktop
		)

build()
{
	convert "${srcdir}/MegaLogViewer/MegaLogViewer.ico" -alpha set "${srcdir}/MegaLogViewer/megalogviewer.png"
}

package()
{
	for icon in ${srcdir}/MegaLogViewer/megalogviewer-*.png; do
		size=$(identify -format '%wx%h' "${icon}")
		mkdir -p "${pkgdir}/usr/share/icons/hicolor/${size}/apps"
		install -m644 "$icon" "${pkgdir}/usr/share/icons/hicolor/${size}/apps/${pkgname}.png"
		rm -f "$icon"
	done
	mkdir -p "${pkgdir}/usr/lib"
	cp -a "${srcdir}/MegaLogViewer" "${pkgdir}/usr/lib/megalogviewer"
	
	mkdir -p "${pkgdir}/usr/bin"
	install -m755 "${srcdir}/megalogviewer.sh" "${pkgdir}/usr/bin/megalogviewer"
	
	mkdir -p "${pkgdir}/usr/share/applications"
	install -m644 "${srcdir}/megalogviewer.desktop" "${pkgdir}/usr/share/applications/megalogviewer.desktop"
}
sha256sums=('35ef6a6247f5738a44c71e11bbfa36f773eb02b45648b859383fb047855b999a'
            '5434db388a8404eff299fd2fb2f018d231cdc816363c27a9c622850cc659233c'
            '6c6238646f60a076ebe0549228b59d7d9f20bc7019a0e7d8b5df2089ba50a396')
