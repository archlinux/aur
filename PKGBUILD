# Maintainer: usagi-flow <>

pkgname=evil-helix-bin
pkgver=20250601
pkgrel=1
pkgdesc="Helix fork with Vim keybindings and more"
arch=('x86_64')
url="https://github.com/usagi-flow/evil-helix"
license=('MPL2')

provides=('helix')
conflicts=('helix')

source=("https://github.com/usagi-flow/evil-helix/releases/download/release-$pkgver/evil-helix-amd64-linux.tar.gz")
sha512sums=("a2b847c112d7ca694e1c51c2e371621ef1ea07d8a8d3454fea4a38c0b4267505ee8ff0e9ac228ee71d78b30bc8016844b10980dbb534bdfa77f7bacb44d7365a")

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