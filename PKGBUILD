# Maintainer: brainblasted <brainblasted at disroot dot org>

pkgname="libhandy-git"
pkgbase="libhandy"
_gitname="libhandy"
depends=('gtk3' 'vala' 'gnome-desktop' 'gobject-introspection' 'gtk-doc')
pkgdesc="A library full of GTK+ widgets for mobile phones"
url="https://code.puri.sm/Librem5/libhandy"
license=('LGPL2.1')
makedepends=('git' 'pkg-config' 'meson')
pkgver=r108.297eae2
pkgrel=1
arch=('x86_64')
source=("git+https://code.puri.sm/Librem5/libhandy.git")
sha256sums=('SKIP')

pkgver() {
    cd ${_gitname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd ${_gitname}
    meson . _build --prefix=/usr
    ninja -C _build
}

package() {
    cd ${_gitname}
    DESTDIR="${pkgdir}" ninja -C _build install
}
