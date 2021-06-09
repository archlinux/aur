# Maintainer: Christian Finnberg <christian@finnberg.net>
pkgname=notesnook
pkgver=1.3.6
pkgrel=1
pkgdesc="A simple & easy to use private note-taking app that encrypts everything on the client side."
arch=('x86_64')
url="https://notesnook.com/"
license=('Unknown')
depends=('gtk3' 'nss')
source=("https://github.com/streetwriters/$pkgname/releases/download/v$pkgver/${pkgname}_${pkgver}_amd64.deb")
sha256sums=('6d5b3a7aed4ba1aec26b60f8e40e923b4c5c102ffc584a7731482371e6a7341b')

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
