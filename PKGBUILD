# Maintainer: usagi-flow <>

pkgname=evil-helix-bin
pkgver=20240618
pkgrel=1
pkgdesc="Helix fork with Vim keybindings and more"
arch=('x86_64')
url="https://github.com/usagi-flow/evil-helix"
license=('MPL2')

provides=('helix')
conflicts=('helix')

source=("https://github.com/usagi-flow/evil-helix/releases/download/release-$pkgver/helix-amd64-linux.tar.gz")
sha512sums=("18597b6f1af354a7886924a0adb8865561348270a9ed3aece4b787fb6decc94212361442a5b7ab7c4525ba06e97467730799d2adf236582e5405dabf39e3ddbb")

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