# Maintainer: Philip Goto <philip.goto@gmail.com>
# Contributor: Pellegrino Prevete <pellegrinoprevete@gmail.com>

pkgname=libhandy-4-git
pkgver=0.80.0.r524.ga934fcd
pkgrel=1
pkgdesc="Library full of GTK+ widgets for mobile phones"
url="https://gitlab.gnome.org/exalm/libhandy"
license=(LGPL)
arch=(i686 x86_64 armv7h aarch64)
depends=(gtk3)
makedepends=(git glade gobject-introspection meson vala)
checkdepends=(xorg-server-xvfb)
provides=(libhandy-4 libhandy-4.so)
source=("git+$url.git#branch=gtk4")
md5sums=(SKIP)

pkgver() {
    cd libhandy
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    arch-meson libhandy build -Dgtk_doc=false -Dexamples=false
    DESTDIR="$pkgdir" ninja -C build
}

package() {
    DESTDIR="$pkgdir" ninja -C build install
}
