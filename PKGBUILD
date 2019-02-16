# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=elementary-code-git
pkgver=3.0.2.r114.ge709b455
pkgrel=1
pkgdesc="Code editor designed for elementary OS"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/elementary/code"
license=(GPL3)
depends=(editorconfig-core-c
         granite
         gtksourceview3
         gtkspell3
         libgit2-glib
         libpeas
         vala
         vte3
         webkit2gtk
         zeitgeist)
makedepends=(editorconfig-core-c
             git
             gobject-introspection
             granite
             gtksourceview3
             libgit2-glib
             libpeas
             meson
             vala
             zeitgeist)
provides=(elementary-code)
conflicts=(elementary-code)
source=("git+https://github.com/elementary/code.git")
md5sums=('SKIP')

pkgver() {
    cd code
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    arch-meson code build
    ninja -C build
}

check() {
    ninja -C build test
}

package() {
    DESTDIR="$pkgdir/" ninja -C build install
}
