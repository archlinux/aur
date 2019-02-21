# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=akira-git
pkgver=r212.7bb31e7
pkgrel=1
pkgdesc="Native Linux App for UI and UX Design built in Vala and Gtk"
arch=(x86_64)
url="https://github.com/Alecaddd/Akira"
license=(GPL3)
depends=(goocanvas granite)
makedepends=(goocanvas
             granite
             gtksourceview3
             meson
             vala)
#checkdepends=(vala-lint)
provides=(akira)
source=("git+https://github.com/Alecaddd/Akira.git")
sha256sums=(SKIP)

pkgver() {
    cd Akira
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    arch-meson Akira build
    ninja -C build
}

#check() {
#    ninja -C build test
#}

package() {
    DESTDIR="${pkgdir}" ninja -C build install
}
