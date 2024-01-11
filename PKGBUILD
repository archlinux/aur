# Maintainer: Junxuan Liao <mikeljx at 126 dot com>

_pkgname=xournalpp-libadwaita-mockup
pkgname=$_pkgname-git
pkgver=r95.7ad03bd
pkgrel=1
pkgdesc="Mockups for redesiging Xournal++ with Gtk4/Libadwaita"
arch=('any')
url="https://github.com/rolandlo/xournalpp-libadwaita-mockup"
license=('GPL-2.0-only')
depends=(
    'gtk4'
    'gtksourceview5'
    'libadwaita'
    'python-gobject'
    'poppler-glib'
    'python'
)
makedepends=('git' 'meson' 'ninja' 'blueprint-compiler')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "${_pkgname}"
    arch-meson build
    meson compile -C build
}

package() {
	cd "${_pkgname}"
    meson install -C build --destdir "$pkgdir"
    chmod 755 "$pkgdir"/usr/bin/xournalpp-demo
}

