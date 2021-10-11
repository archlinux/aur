# Maintainer: Ada <adadonderr@gmail.com>
# Contributor: Christian Finnberg <christian@finnberg.net>
pkgname=notesnook
pkgver=1.5.5
pkgrel=1
pkgdesc="A simple & easy to use private note-taking app that encrypts everything on the client side."
arch=('x86_64')
url="https://notesnook.com/"
license=('Unknown')
depends=('gtk3' 'nss')
source=("${pkgname}_${pkgver}_amd64.deb"::"https://github.com/streetwriters/$pkgname/releases/download/v$pkgver/${pkgname}_amd64.deb")
sha256sums=('8c0331cd397bd6feae27123aba6612b2abbdfb120ca1948bdfa0f21539db2afa')

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
