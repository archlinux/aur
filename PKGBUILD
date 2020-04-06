# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=marker
pkgver=2020.04.04.2
pkgrel=1
pkgdesc='Markdown editor for linux made with Gtk+-3.0'
arch=('x86_64')
url='https://fabiocolacio.github.io/Marker/'
license=('GPL3')
depends=('gtksourceview3' 'gtkspell3' 'webkit2gtk')
makedepends=('git' 'meson')
optdepends=('pandoc: export to HTML, PDF, RTF, OTF, DOCX, LaTeX')
options=(!buildflags)
source=("$pkgname::git+https://github.com/fabiocolacio/Marker.git#tag=$pkgver")
sha256sums=('SKIP')

prepare() {
    cd $pkgname
    git submodule update --init --recursive
}

build() {
    arch-meson $pkgname build
    ninja -C build
}

package() {
    DESTDIR="$pkgdir" ninja -C build install
}
