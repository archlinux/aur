# Contributor: gardenapple <mailbox@appl.garden>
# Maintainer: tee < teeaur at duck dot com >

pkgname=agregore-browser-bin
pkgver=2.22.0
pkgrel=1
pkgdesc='A minimal web browser for the distributed web'
provides=('agregore-browser')
arch=('x86_64')
url='https://github.com/AgregoreWeb/agregore-browser'
license=('AGPL-3.0-or-later')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libsecret')
options=('!strip')
source_x86_64=("$url/releases/download/v$pkgver/agregore-browser-$pkgver-linux-x64.pacman")
b2sums_x86_64=('dc47b7944bfcb08d0bc28dab5423cb8385fab46639685be89d60e149acf965319d66b781de3f96a68e04f0315b2424020cd6edcb25f94c3247280490e69750cd')

package() {
	mv opt/ usr/ "$pkgdir"

	# Fix icon location
	mkdir -p "$pkgdir/usr/share/icons/hicolor/scalable"
	install -Dm644 "$pkgdir/opt/Agregore Browser/resources/app.asar.unpacked/src/pages/icon.svg" -t "$pkgdir/usr/share/icons/hicolor/scalable/"

	# # SUID chrome-sandbox for Electron 5+
	# chmod 4755 '/opt/Agregore Browser/chrome-sandbox' || true

	install -dm755 "$pkgdir/usr/bin"
	ln -s '/opt/Agregore Browser/agregore-browser' "$pkgdir/usr/bin/agregore-browser"
}
