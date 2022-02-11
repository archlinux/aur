# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=marker-git
pkgver=2020.04.04.2.r82.g73b4c484
pkgrel=1
pkgdesc='Markdown editor for linux made with Gtk+-3.0'
arch=('x86_64')
url='https://fabiocolacio.github.io/Marker/'
license=('GPL3')
depends=('gtksourceview3' 'gtkspell3' 'webkit2gtk')
makedepends=('git' 'itstool' 'meson')
optdepends=('pandoc: export to HTML, PDF, RTF, OTF, DOCX, LaTeX')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
options=(!buildflags)
source=("${pkgname%-*}::git+https://github.com/fabiocolacio/Marker.git")
sha256sums=('SKIP')

pkgver() {
    cd ${pkgname%-*}
    git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
    cd ${pkgname%-*}
    git submodule update --init --recursive
    ln -sv ../../po/uk.po help/uk/uk.po
}

build() {
    arch-meson ${pkgname%-*} build
    ninja -C build
}

package() {
    DESTDIR="$pkgdir" ninja -C build install
}
