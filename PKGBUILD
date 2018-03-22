# Maintainer: spider-mario <spidermario@free.fr>
pkgname=('cinnxp' 'cinnxp-icons')
pkgver=1.1.0
pkgrel=5
pkgdesc="XP-like theme for Cinnamon"
arch=('any')
url="https://github.com/petrucci4prez/CinnXP"
license=('GPL3')
makedepends=('git' 'sassc' 'xorg-xcursorgen')
options=('!strip')
source=('cinnxp::git+https://github.com/petrucci4prez/CinnXP.git#commit=4eb68d6c2784b8ae64961c0beee2f37b353f5f60')
sha512sums=('SKIP')

build() {
	cd cinnxp

	rm -fr pkg
	./compile-theme -a -g 20

	find pkg -type d -exec chmod 755 '{}' +
	find pkg -type f -exec chmod 644 '{}' +
}

package_cinnxp() {
	optdepends=('gtk2' 'gtk3' 'cinnamon' 'metacity' 'cinnxp-icons')
	conflicts=('cinnxp-royale' 'cinnxp-metallic')
	provides=('cinnxp-royale' 'cinnxp-metallic')
	replaces=('cinnxp-royale' 'cinnxp-metallic')

	cd "$pkgdir"
	cp -a "$srcdir"/cinnxp/pkg/usr .
	rm -fr usr/share/icons
}

package_cinnxp-icons() {
	pkgdesc="XP-like theme for Cinnamon (Cursors)"

	cd "$pkgdir"
	cp -a "$srcdir"/cinnxp/pkg/usr .
	rm -fr usr/share/themes
}
