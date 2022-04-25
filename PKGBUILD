# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=paper-note
_pkgname=paper
pkgver=22.2
pkgrel=1
pkgdesc="A pretty note-taking app for GNOME"
arch=('x86_64')
url="https://gitlab.com/posidon_software/paper"
license=('GPL3')
depends=('glib2' 'libadwaita' 'gtksourceview5' 'libgee')
makedepends=('meson' 'gobject-introspection' 'vala')
source=($url/-/archive/$pkgver/$_pkgname-$pkgver.tar)
b2sums=('756a954fd16630f826319ca09b3001a26d2f1e86fe13463658ae37aa60b609fa1d1109ba3bb9abc408d7cea02f63e4c089ef3156d7648ced66fef33a4b9f9b48')

prepare() {
	cd "$_pkgname-$pkgver"
	
	mv data/markdown.lang data/paper_markdown.lang
	
	sed -i 's/markdown.lang/paper_markdown.lang/g' \
    data/meson.build
}

build() {
  arch-meson "$_pkgname-$pkgver" build
  meson compile -C build
}

#check() {
#  meson test -C build
#}

package() {
  meson install -C build --destdir "$pkgdir"
}
