# Maintainer: Neil Simpson <neilsimp1@gmail.com>

pkgname=magicmirror
_pkgname=MagicMirror
pkgver=2.14.0
pkgrel=1
pkgdesc="Open source modular smart mirror platform."
arch=("any")
url="https://magicmirror.builders/"
license=("MIT")
depends=("gtk3" "libxss" "nodejs" "nss")
makedepends=("git" "npm")
source=("https://github.com/MichMich/$_pkgname/archive/v$pkgver.tar.gz"
	"magicmirror.desktop"
	"magicmirror.png"
	"magicmirror.sh")
sha256sums=("1bf9689be8af6fc7fc4b7f4aa74b905de0b43f3eba0a894eb2ab504089246019"
	"44d4754359eea4f95f506a05a8eeeb849a5a1c79d22085f7a49e20f4cb248cc6"
	"8b863c41ab31114c92e060fa724e1ef63d4023cd534dafa96d49e943c346959c"
	"0595927a2b55ac88403f495afd413e32e72ada9262e0c709b96c7e62453fb039")

build() {
	cd "$srcdir/$_pkgname-$pkgver"

	npm install --cache "${srcdir}/npm-cache" --only=prod
	cp config/config.js.sample config/config.js
}

package() {
	cd "$srcdir"

	install -Dm 644 magicmirror.desktop "$pkgdir"/usr/share/applications/magicmirror.desktop
	install -Dm 644 magicmirror.png "$pkgdir"/usr/share/icons/magicmirror.png
	install -Dm 755 magicmirror.sh "$pkgdir"/usr/bin/$pkgname

	mkdir "$pkgdir"/usr/share/$pkgname
	cp -R "$_pkgname-$pkgver"/* "$pkgdir"/usr/share/$pkgname

	cd "$_pkgname-$pkgver"

	install -Dm 644 LICENSE.md -t "$pkgdir"/usr/share/licenses/$pkgname
}
