# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=nautilus-ext-git-git
pkgver=1.3.r16.g5389549
pkgrel=1
pkgdesc="Nautilus extension to add important information about the current git directory"
arch=('i686' 'x86_64')
url="https://github.com/bilelmoussaoui/nautilus-git"
license=('GPL3')
depends=('git' 'gobject-introspection' 'gtk3' 'python-nautilus')
makedepends=('gnome-common' 'meson' 'intltool')
provides=("${pkgname%-git}" 'nautilus-git=1.3')
conflicts=("${pkgname%-git}" 'nautilus-git=1.3')
source=("${pkgname%-git}::git+https://github.com/bilelmoussaoui/nautilus-git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	arch-meson builddir -Dpost_install=false -Dfile_manager=nautilus
	ninja -C builddir
}

package() {
	cd "$srcdir/${pkgname%-git}"
	DESTDIR="$pkgdir" ninja -C builddir install
}
