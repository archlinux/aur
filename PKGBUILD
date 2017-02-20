# Maintainer: spider-mario <spidermario@free.fr>
pkgname=('cinnxp' 'cinnxp-icons' 'cinnxp-royale' 'cinnxp-metallic')
pkgver=1.1.0
pkgrel=2
pkgdesc="XP-like theme for Cinnamon"
arch=('any')
url="https://github.com/petrucci4prez/CinnXP"
license=('unknown')
makedepends=('git' 'ruby-bundler' 'ruby-sass' 'xorg-xcursorgen')
optdepends=('gtk2' 'gtk3' 'cinnamon' 'metacity' 'cinnxp-icons')
options=('!strip')
source=('cinnxp::git+https://github.com/petrucci4prez/CinnXP.git#commit=93708aed2dfe6eb539999614e249f5e50d868ea3')
sha512sums=('SKIP')

build() {
	cd cinnxp

	rm -fr pkg{,-royale}
	./compile-theme
	./compile-theme -f royale -n pkg-royale
	./compile-theme -f metallic -n pkg-metallic

	find pkg{,-royale,-metallic} -type d -exec chmod 755 '{}' +
	find pkg{,-royale,-metallic} -type f -exec chmod 644 '{}' +
}

package_cinnxp() {
	cd "$pkgdir"
	cp -a "$srcdir"/cinnxp/pkg/usr .
	rm -fr usr/share/icons
}

package_cinnxp-icons() {
	pkgdesc="XP-like theme for Cinnamon (Cursors)"
	optdepends=()

	cd "$pkgdir"
	cp -a "$srcdir"/cinnxp/pkg/usr .
	rm -fr usr/share/themes
}

package_cinnxp-royale() {
	pkgdesc="XP-like theme for Cinnamon (Royale variant)"

	cd "$pkgdir"
	cp -a "$srcdir"/cinnxp/pkg-royale/usr .
	rm -fr usr/share/icons
}

package_cinnxp-metallic() {
	pkgdesc="XP-like theme for Cinnamon (Metallic variant)"

	cd "$pkgdir"
	cp -a "$srcdir"/cinnxp/pkg-metallic/usr .
	rm -fr usr/share/icons
}
