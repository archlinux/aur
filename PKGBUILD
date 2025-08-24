# Maintainer: usagi-flow <>

pkgname=evil-helix-bin
pkgver=20250823
pkgrel=1
pkgdesc="Helix fork with Vim keybindings and more"
arch=('x86_64')
url="https://github.com/usagi-flow/evil-helix"
license=('MPL2')

provides=('helix')
conflicts=('helix')

source=("https://github.com/usagi-flow/evil-helix/releases/download/release-$pkgver/evil-helix-amd64-linux.tar.gz")
sha512sums=("7bab44b495e03b45d0876565c599611991e36ee80a1d505a6cef7dc1da44a313b53b3c69b2dd6b2f08422b551241f6668c0f23527acc95af52c70fd590f84c03")

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