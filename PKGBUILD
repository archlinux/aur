# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=whitesur-gtk-theme-git
pkgver=2021.04.08.r11.gc8cdf39
pkgrel=1
pkgdesc="MacOS Big Sur like theme for GNOME desktops"
arch=('any')
url="https://github.com/vinceliuice/WhiteSur-gtk-theme"
license=('GPL')
depends=('gtk-engine-murrine' 'gtk-engines' 'gtk3')
makedepends=('dialog' 'git' 'imagemagick' 'libnotify' 'sassc')
optdepends=('whitesur-icon-theme-git: matching icon theme'
            'whitesur-cursor-theme-git: matching cursor theme'
            'whitesur-kvantum-theme: matching Kvantum theme'
            'plank: for included plank theme')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!strip')
source=("${pkgname%-git}::git+https://github.com/vinceliuice/WhiteSur-gtk-theme.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -d "$pkgdir/usr/share/themes"
	./install.sh -t all -d "$pkgdir/usr/share/themes"

	install -Dm644 src/other/plank/theme-dark/* -t \
		"$pkgdir/usr/share/plank/themes/WhiteSur-dark"
	install -Dm644 src/other/plank/theme-light/* -t \
		"$pkgdir/usr/share/plank/themes/WhiteSur-light"
	install -d "$pkgdir/usr/share/docs/$pkgname"
	cp -r src/other/{dash-to-dock,firefox} "$pkgdir/usr/share/docs/$pkgname"
}
