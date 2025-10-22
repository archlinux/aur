# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=millisecond-git
pkgver=0.2.0.r4.g818d194
pkgrel=1
pkgdesc="Optimize your Linux system for low latency audio"
arch=('any')
url="https://github.com/gaheldev/Millisecond"
license=('GPL-3.0-or-later')
depends=(hicolor-icon-theme gtk4 python-gobject dconf python libadwaita glib2)
makedepends=(meson ninja git)
provides=(${pkgname::-4})
conflicts=(${pkgname::-4})
source=("$pkgname::git+$url.git")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()


pkgver() {
	cd "$srcdir/$pkgname"
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g'
}

prepare() {
	cd "$srcdir/$pkgname"
}

build() {
	cd "$srcdir"
	arch-meson "$pkgname" build
	meson compile -C build
}

package() {
	cd "$srcdir"
	meson install -C build --destdir="$pkgdir"
}
