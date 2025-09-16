# Maintainer: usagi-flow <>

pkgname=evil-helix-bin
pkgver=20250915
pkgrel=1
pkgdesc="Helix fork with Vim keybindings and more"
arch=('x86_64')
url="https://github.com/usagi-flow/evil-helix"
license=('MPL2')

provides=('helix')
conflicts=('helix')

source=("https://github.com/usagi-flow/evil-helix/releases/download/release-$pkgver/evil-helix-amd64-linux.tar.gz")
sha512sums=("bf8b8c6dda156e888d0695c570750357713c0881bf2e44396a696c27c416992d63ee1214e0c3851c58f53e7835d370912bd10974489c5808a38f7a6e68b92831")

options=('!debug' '!lto')

package() {
	install -d "$pkgdir/opt/helix"

	install -D -m755 helix/hx "$pkgdir/opt/helix/hx"
	cp -r helix/runtime "$pkgdir/opt/helix/"

	mkdir -p "$pkgdir/usr/local/bin"
	cd "$pkgdir/usr/local/bin"
	if [ ! -e hx ]; then
		ln -sv "../../../opt/helix/hx" .
	fi
}