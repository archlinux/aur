# Maintainer: usagi-flow <>

pkgname=evil-helix-bin
pkgver=20250413
pkgrel=1
pkgdesc="Helix fork with Vim keybindings and more"
arch=('x86_64')
url="https://github.com/usagi-flow/evil-helix"
license=('MPL2')

provides=('helix')
conflicts=('helix')

source=("https://github.com/usagi-flow/evil-helix/releases/download/release-$pkgver/evil-helix-amd64-linux.tar.gz")
sha512sums=("968bdf713d32b188bd10b9b99d4603e524f5cece7655258bd151551ce20cf4442200d0585e89b4bbc3123cb7f1c30bccbd3438a27e31005ccfe256729c59713b")

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