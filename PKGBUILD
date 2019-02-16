# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=akira-git
pkgver=r167.443668c
pkgrel=1
pkgdesc="Native Linux App for UI and UX Design built in Vala and Gtk"
arch=(x86_64)
url="https://github.com/Alecaddd/Akira"
license=(GPL3)
depends=(granite)
makedepends=(granite
             gtksourceview3
             meson
             vala)
#checkdepends=(vala-lint-git)
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
