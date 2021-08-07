# Maintainer: Christian Finnberg <christian@finnberg.net>
pkgname=notesnook
pkgver=1.5.0
pkgrel=1
pkgdesc="A simple & easy to use private note-taking app that encrypts everything on the client side."
arch=('x86_64')
url="https://notesnook.com/"
license=('Unknown')
depends=('gtk3' 'nss')
source=("https://github.com/streetwriters/$pkgname/releases/download/v$pkgver/${pkgname}_amd64.deb")
sha256sums=('fda20be93b46a12c887aa4b00f9dc2148455819a0925c4c52c320fe5c7dfcfe1')

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
