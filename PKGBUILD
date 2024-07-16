# Maintainer: usagi-flow <>

pkgname=evil-helix-bin
pkgver=20240716
pkgrel=1
pkgdesc="Helix fork with Vim keybindings and more"
arch=('x86_64')
url="https://github.com/usagi-flow/evil-helix"
license=('MPL2')

provides=('helix')
conflicts=('helix')

source=("https://github.com/usagi-flow/evil-helix/releases/download/release-$pkgver/helix-amd64-linux.tar.gz")
sha512sums=("b753fe17f68a2799d084bf30a647cf747382ea6531ac648bbff0fd315f69f6768b160b88077a18587a2bfddd5af6234fc1aa688c1e16db8ad78e72d3ddeccd51")

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