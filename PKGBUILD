# Maintainer: ARKye03 <rafa03-dev@proton.me>

pkgname=icon-theme-browser-git
pkgver=r8.dee1c2b # Can't be empty, will be set dynamically
pkgrel=1
pkgdesc="Browse system installed icon themes (DEPRECATED USE icon-browser)"
arch=(x86_64)
license=('MIT')
url="https://github.com/Aylur/icon-theme-browser"
depends=(
	gtk4
	glib2
	gjs
)
makedepends=(
	git
	gobject-introspection
	meson
	blueprint-compiler
	ninja
	npm
	esbuild
	desktop-file-utils
	libadwaita
)
source=("${pkgname}::git+$url#commit=dee1c2bf4f6fa46544670f43ea6ab02ee27111ac")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname" || exit
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "$pkgname" || exit
	npm install
	arch-meson --prefix /usr build
	meson compile -C build
}

package() {
	cd "$pkgname" || exit
	meson install -C build --destdir "$pkgdir"
}
