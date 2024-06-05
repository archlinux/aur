# Maintainer: usagi-flow <>

pkgname=evil-helix-bin
pkgver=20240601
pkgrel=1
pkgdesc="Helix fork with Vim keybindings and more"
arch=('x86_64')
url="https://github.com/usagi-flow/evil-helix"
license=('MPL2')

provides=('helix')
conflicts=('helix')

source=("https://github.com/usagi-flow/evil-helix/releases/download/release-$pkgver/helix-amd64-linux.tar.gz")
sha512sums=("06d4aac17ab41bc65aaadab3b085ac99fad4e1ef8cc9ad4c7e428ee0f725a6da5df1038ae48a67a6ac0eb35c34e9e399fe073ec0e34045463c8c3fa051aba312")

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