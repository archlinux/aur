# Maintainer: Philip Goto <philip.goto@gmail.com>

_pkgname=elementary-code
pkgname=$_pkgname-git
pkgver=3.0.r0.gec222a7a
pkgrel=1
pkgdesc="Code editor designed for elementary OS"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/elementary/code"
license=(GPL3)
depends=(gtk3)
makedepends=(editorconfig-core-c
             git
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
    rm -rf build
    arch-meson code build
    ninja -v -C build
}

package() {
    DESTDIR="$pkgdir/" ninja -C build install
}
