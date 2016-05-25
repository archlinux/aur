# Maintainer: spider-mario <spidermario@free.fr>
pkgname=('cinnxp' 'cinnxp-royale')
pkgver=1.1.0
pkgrel=1
pkgdesc="XP-like theme for Cinnamon"
arch=('any')
url="http://cinnamon-spices.linuxmint.com/themes/view/498"
license=('unknown')
makedepends=('git' 'ruby-bundler' 'ruby-sass' 'xorg-xcursorgen')
optdepends=('gtk2' 'gtk3' 'cinnamon' 'metacity')
options=('!strip')
source=('cinnxp::git+https://github.com/petrucci4prez/CinnXP.git#commit=a1b1a3182fa21f2b4d376b4f071c9c839a8d5a9d')
sha512sums=('SKIP')

build() {
	cd cinnxp

	rm -fr pkg{,-royale}
	./compile-theme
	./compile-theme -r -n pkg-royale

	find pkg{,-royale} -type d -exec chmod 755 '{}' +
	find pkg{,-royale} -type f -exec chmod 644 '{}' +

	cd pkg-royale/usr/share
	for subdir in *; do
		mv "$subdir"/CinnXP{,-Royale}
	done
	perl -pe 's/(?<=CinnXP)/-Royale/' -i icons/CinnXP-Royale/cursor.theme
}

package_cinnxp() {
	cd "$pkgdir"
	cp -aR "$srcdir"/cinnxp/pkg/usr .
}

package_cinnxp-royale() {
	pkgdesc="XP-like theme for Cinnamon (Royale variant)"

	cd "$pkgdir"
	cp -aR "$srcdir"/cinnxp/pkg-royale/usr .
}
