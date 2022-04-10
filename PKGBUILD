# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=paper-note
_pkgname=paper
pkgver=22.1
pkgrel=1
pkgdesc="A pretty note-taking app for GNOME"
arch=('x86_64')
url="https://gitlab.com/posidon_software/paper"
license=('GPL3')
depends=('glib2' 'libadwaita' 'gtksourceview5' 'libgee')
makedepends=('meson' 'gobject-introspection' 'vala')
source=($url/-/archive/$pkgver/$_pkgname-$pkgver.tar)
b2sums=('b6860fd9b34f86bae81a2573903d1f1579d17e98ef56f784d75327bc8c47d51cad76986e897ee70fb36f8f055fa0990ce4809f7a38b41fb2ff184a0982af696b')

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

check() {
  meson test -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
