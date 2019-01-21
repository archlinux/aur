# Maintainer: Philip Goto <philip.goto@gmail.com>

_pkgname=elementary-code
pkgname=$_pkgname-git
pkgver=3.0.2.r72.g8a19ff3f
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
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/elementary/code.git")
md5sums=('SKIP')

pkgver() {
    cd code
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    arch-meson code build -Db_pie=false
    ninja -v -C build
}

package() {
    DESTDIR="$pkgdir/" ninja -C build install
}
