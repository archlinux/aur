# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=paper-note
_pkgname=paper
pkgver=22.5
pkgrel=1
pkgdesc="A pretty note-taking app for GNOME"
arch=('x86_64')
url="https://gitlab.com/posidon_software/paper"
license=('GPL3')
depends=('glib2' 'libadwaita' 'gtksourceview5' 'libgee')
makedepends=('meson' 'gobject-introspection' 'blueprint-compiler' 'vala')
source=($url/-/archive/$pkgver/$_pkgname-$pkgver.tar)
b2sums=('21eba7fb3fa8b8e270b30243f97b018d5ccce373c8180d6a886472f03056a22942eaa063c7be6621734a7fead35e95049410f7b05943aa405797203395998ecd')

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
