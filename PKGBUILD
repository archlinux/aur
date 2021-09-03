# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=wacom-settings-git
pkgver=r4.7a95404
pkgrel=1
epoch=
pkgdesc="GUI for calibrating the wacom tablet to a screen or window"
arch=('any')
url="https://github.com/avargas05/wacom-settings"
license=('GPL3')
groups=()
depends=('xf86-input-wacom' 'gtk4')
makedepends=('meson' 'git')
checkdepends=()
optdepends=()
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
source=("$pkgname::git+$url.git")
sha256sums=("SKIP")

pkgver() {
	cd "$srcdir/$pkgname"
	( set -o pipefail
	git describe --tags --long 2>/dev/null | sed 's/^v-//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	arch-meson "$pkgname" build

	meson compile -C build
}

package() {
	DESTDIR="$pkgdir" meson install -C build
}
