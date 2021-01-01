# Maintainer: rany <rany@disroot.org>
pkgname=glowing-bear-electron
pkgver=0.9.0
pkgrel=10
pkgdesc="A web client for Weechat (Electron version)"
arch=(any)
url="https://www.glowing-bear.org/"
license=('GPL-3.0')
groups=(irc weechat)
depends=(electron glowing-bear-web)
makedepends=(librsvg)
source=("glowing-bear.desktop"
	"glowing-bear.sh")
sha256sums=("SKIP"
	"SKIP")

package() {
	# Register the binary as glowing-bear
	install -Dm755 "${srcdir}/glowing-bear.sh" "${pkgdir}/usr/bin/glowing-bear"
	
	# Add the scalable icon
	mkdir -p "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
	ln -sf /usr/share/webapps/glowing-bear/assets/img/glowing-bear.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/glowing-bear.svg"
	
	# Add the non-scalable icon
	for icon in 16 22 24 32 36 48 64 72 96 128 192 256 384 512; do
		mkdir -p "${pkgdir}/usr/share/icons/hicolor/${icon}x${icon}/apps"
		rsvg-convert -h $icon -w $icon /usr/share/webapps/glowing-bear/assets/img/glowing-bear.svg -o "${pkgdir}/usr/share/icons/hicolor/${icon}x${icon}/apps/glowing-bear.png"
	done

	# Setup /usr/lib/glowing-bear
	mkdir -p "${pkgdir}/usr/lib/glowing-bear"
	ln -sf /usr/share/webapps/glowing-bear "${pkgdir}/usr/lib/glowing-bear/webapp"

	# Add the .desktop file
	install -Dm644 "$srcdir/glowing-bear.desktop" "${pkgdir}/usr/share/applications/glowing-bear.desktop"
}
