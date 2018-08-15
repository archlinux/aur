# Maintainer: Philip Goto <philip.goto@gmail.com>

_pkgname="phosh"
pkgname="${_pkgname}-git"
pkgver="latest"
pkgrel="1"
pkgdesc="A pure Wayland shell prototype for GNOME on mobile devices"
url="https://source.puri.sm/Librem5/${_pkgname}"
license=("GPL3")

arch=("x86_64")
depends=("gtk3"
         "vala"
         "gnome-desktop"
         "gobject-introspection"
         "gtk-doc"
         "libhandy"
         "wlroots")
makedepends=("git"
             "pkg-config"
             "meson")
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("git+https://source.puri.sm/Librem5/${_pkgname}.git")
sha256sums=("SKIP")

pkgver() {
    cd "${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    rm -rf build
    arch-meson "${_pkgname}" build -Dtests=false
    ninja -C build
}

package() {
    DESTDIR="${pkgdir}" ninja -C build install
}
