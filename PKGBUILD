# Maintainer: brainblasted <brainblasted at disroot dot org>

pkgname="libhandy-git"
pkgbase="libhandy"
_gitname="libhandy"
depends=('gtk3' 'vala' 'gnome-desktop' 'gobject-introspection' 'gtk-doc')
pkgdesc="A library full of GTK+ widgets for mobile phones"
url="https://code.puri.sm/Librem5/libhandy"
license=('LGPL2.1')
makedepends=('git' 'pkg-config' 'meson')
pkgver=r192.56cd9bd
pkgrel=1
arch=('x86_64')
source=("git+https://source.puri.sm/Librem5/libhandy.git")
sha256sums=('SKIP')

pkgver() {
    cd ${_gitname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd ${_gitname}
    meson . _build --prefix=/usr -Dexamples=false -Dgtk_doc=true
    ninja -C _build
    ninja -C _build libhandy-doc
}

package() {
    cd ${_gitname}
    DESTDIR="${pkgdir}" ninja -C _build install
}
