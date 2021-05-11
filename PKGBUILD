# Maintainer: Christian Finnberg <christian@finnberg.net>
pkgname=notesnook
pkgver=1.3.5
pkgrel=1
pkgdesc="A simple & easy to use private note-taking app that encrypts everything on the client side."
arch=('x86_64')
url="https://notesnook.com/"
license=('Unknown')
depends=('gtk3' 'nss')
source=("https://github.com/streetwriters/$pkgname/releases/download/v$pkgver/${pkgname}_${pkgver}_amd64.deb")
sha256sums=('26f9414ee7e5bca61ae656952439d1504ac16af41a1c7e91a4517e75fe58ca90')

package() {
	bsdtar -xf data.tar.xz -C "$pkgdir"
	
	# Link to the binary
	mkdir -p "${pkgdir}/usr/bin"
	ln -s '/opt/Notesnook/Notesnook' "${pkgdir}/usr/bin/Notesnook"
}

post_install() {
	# SUID chrome-sandbox for Electron 5+
	chmod 4755 "${pkgdir}/opt/Notesnook/chrome-sandbox" || true

	update-mime-database /usr/share/mime || true
	update-desktop-database /usr/share/applications || true
}