# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=whitesur-gtk-theme-git
pkgver=r25.9adb711
pkgrel=1
pkgdesc="MacOS Big Sur like theme for GNOME desktops"
arch=('any')
url="https://github.com/vinceliuice/WhiteSur-gtk-theme"
license=('GPL')
depends=('gtk-engine-murrine' 'gtk-engines' 'gtk3')
makedepends=('git' 'sassc' 'optipng' 'inkscape')
optdepends=('whitesur-icon-theme-git: matching icon theme'
            'whitesur-cursor-theme-git: matching cursor theme'
            'plank: for included plank theme')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!strip')
source=("${pkgname%-git}::git+https://github.com/vinceliuice/WhiteSur-gtk-theme.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -d "$pkgdir/usr/share/themes"
	./install.sh -d "$pkgdir/usr/share/themes"

	install -Dm644 src/other/plank/theme-dark/* -t \
		"$pkgdir/usr/share/plank/themes/WhiteSur-dark"
	install -Dm644 src/other/plank/theme-light/* -t \
		"$pkgdir/usr/share/plank/themes/WhiteSur-light"
}
