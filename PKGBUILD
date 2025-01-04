# Maintainer: usagi-flow <>

pkgname=evil-helix-bin
pkgver=20250104
pkgrel=1
pkgdesc="Helix fork with Vim keybindings and more"
arch=('x86_64')
url="https://github.com/usagi-flow/evil-helix"
license=('MPL2')

provides=('helix')
conflicts=('helix')

source=("https://github.com/usagi-flow/evil-helix/releases/download/release-$pkgver/evil-helix-amd64-linux.tar.gz")
sha512sums=("d7547acbfd24518fb21f498e36357a90e87b1f0d801eaa86e7409267f1bdb2f988253b4f2fa05f98dd49cc80c42c6f55bc9b4b8b129c78a1150590ff0b294600")

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