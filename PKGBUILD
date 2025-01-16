# Contributor: joel almeida <aullidolunar at gm_ai1 dot c0m>
# Contributor: 2ion <dev@2ion.de>
pkgname=bunsen-themes-git
pkgver=r202.281e8aa
pkgrel=1
pkgdesc="BunsenLabs GTK/Openbox/Lightdm Themes"
arch=('any')
url="https://github.com/BunsenLabs/bunsen-themes"
license=('GPL-3.0-or-later')
depends=('gtk-engine-murrine')
makedepends=('git')
optdepends=('lib32-gtk-engine-murrine: required for multilib (GTK2)' 'gtk3: required for the GTK3 themes')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/BunsenLabs/bunsen-themes.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/bunsen-themes"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/bunsen-themes/themes"
	find . -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
	cd "$srcdir/bunsen-themes"
	find . -maxdepth 1 -type f -name "LICENSE.*" -exec install -Dm644 '{}' "$pkgdir/usr/share/doc/bunsen-themes-git/{}" \;
}
