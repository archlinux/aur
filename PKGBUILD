# Maintainer: Philip Goto <philip.goto@gmail.com>

_pkgname=elementary-code
pkgname=$_pkgname-git
pkgver=2.4.1.r950.gbaf32f3c
pkgrel=1
pkgdesc="Code editor designed for elementary OS"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/elementary/code"
license=('GPL3')
depends=('gtk3')
makedepends=(editorconfig-core-c
             git
             libgit2-glib
             meson
             vala)
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
