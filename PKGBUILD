# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=adwmod-theme-git
pkgver=r190.012cb0a
pkgrel=1
pkgdesc="A modified default GNOME/GTK theme with some extras/enhancements/additions."
arch=('any')
url="https://gitlab.com/hrdwrrsk/AdwMod-theme"
license=('GPL3')
makedepends=('git' 'meson' 'sassc')
optdepends=('gnome-shell: if not installed during build, will use styles for last gnome-shell version available')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" 'adwaita-extended-git')
replaces=('adwaita-extended-git')
source=("${pkgname%-git}::git+https://gitlab.com/hrdwrrsk/AdwMod-theme.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	arch-meson "${pkgname%-git}" build
	meson compile -C build
}

package() {
	DESTDIR="$pkgdir" meson install -C build
}
