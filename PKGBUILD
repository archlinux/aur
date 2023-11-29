# Maintainer: Marco Schröder <narco dot schroeder 96 at gmail dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=setzer
pkgver=62
pkgrel=1
pkgdesc='LaTeX editor written in Python with Gtk'
arch=('any')
url='https://github.com/cvfosammmm/setzer'
license=('GPL3')
depends=(
	'gspell'
	'gtk3'
	'gtksourceview5'
	'libhandy'
	'libportal'
	'poppler-glib'
	'python-cairo'
	'python-bibtexparser'
	'python-gobject'
	'python-pdfminer'
	'python-pexpect'
	'python-pyxdg'
	'texlive-core'
	'webkit2gtk'
	'webkitgtk-6.0'
	'xdg-utils')
makedepends=('appstream' 'meson')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver/$pkgver.tar.gz"
        "fixtest.patch::https://github.com/cvfosammmm/Setzer/commit/16b53896e547763e528bafbfd95ae44d428f679f.diff")

prepare() {
    patch --directory="Setzer-$pkgver" --forward --strip=1 --input="${srcdir}/fixtest.patch"
}

build() {
  arch-meson "Setzer-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
sha256sums=('dcc954eb440071a9847aabc3c5b064129124b0c53604dbacfc442b21ddcb09a8'
            '23b202d63ade4880ae051d7a6546c22cd6204d5be162a12b5c449244c7be23ff')
