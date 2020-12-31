# Maintainer: rany <rany@disroot.org>
pkgname=glowing-bear-electron
pkgver=0.9.0
pkgrel=5
pkgdesc="A web client for Weechat (Electron version)"
arch=(any)
url="https://www.glowing-bear.org/"
license=('GPL-3.0')
groups=(irc weechat)
depends=(electron glowing-bear-web)
makedepends=(librsvg)
source=("glowing-bear.desktop"
	"glowing-bear.sh")
sha256sums=("8e8f5c38849a8e76e0f217c38c24b5b6b297b7c644ea3513ea80a5ac39787424"
	"5c244284cf3e301328849641a8d09e03e2641610807e849e370b3d717d266e53")

package() {
	# Register the binary as glowing-bear
	install -Dm755 "${srcdir}/glowing-bear.sh" "${pkgdir}/usr/bin/glowing-bear"
	
	# Add the scalable icon
	mkdir -p "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
	ln -sf /usr/share/webapps/glowing-bear/assets/img/glowing-bear.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/glowing-bear.svg"
	
	# Add the non-scalable icon
	for icon in 16 24 32 48 64 128 256; do
		mkdir -p "${pkgdir}/usr/share/icons/hicolor/${icon}x${icon}/apps"
		ln -sf /usr/share/webapps/glowing-bear/assets/img/glowing-bear.svg "${pkgdir}/usr/share/icons/hicolor/${icon}x${icon}/apps/glowing-bear.svg"
		rsvg-convert -h 16 -w 16 /usr/share/webapps/glowing-bear/assets/img/glowing-bear.svg -o "${pkgdir}/usr/share/icons/hicolor/${icon}x${icon}/apps/glowing-bear.png"
	done
	mkdir -p "${pkgdir}/usr/share/icons/hicolor/128x128/apps"
	ln -sf /usr/share/webapps/glowing-bear/assets/img/glowing_bear_128x128.png "${pkgdir}/usr/share/icons/hicolor/128x128/apps/glowing-bear.png"

	# Add the .desktop file
	install -Dm644 "$srcdir/glowing-bear.desktop" "${pkgdir}/usr/share/applications/glowing-bear.desktop"
}
