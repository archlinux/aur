_pkgname=rdw
pkgname=${_pkgname}-git
pkgver=r346.640183f
pkgrel=1
pkgdesc="Gtk4 remote desktop widgets"
arch=('x86_64')
url5="https://gitlab.gnome.org/malureau/rdw"
makedepends=('gobject-introspection' 'cargo-c' 'vala')
source=("git+https://gitlab.gnome.org/malureau/rdw.git")
sha256sums=('SKIP')

pkgver() {
  cd ${srcdir}/${_pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd ${srcdir}/${_pkgname}

    git submodule init
    git submodule update
}

build() {
    cd ${srcdir}/${_pkgname}

    cd rdw4
    make all

}

package() {
    cd ${srcdir}/${_pkgname}
    cd rdw4

    make DESTDIR="${pkgdir}" install
    mv ${pkgdir}/usr/lib64 ${pkgdir}/usr/lib
}

