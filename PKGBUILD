# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=glade-git
pkgver=3.22.0.r319.gb8b1b0fa
pkgrel=1
pkgdesc="User interface builder for GTK+ and GNOME."
provides=(glade)
conflicts=(glade)
arch=(i686 x86_64 armv6h armv7h)
license=(GPL LGPL)
depends=(webkit2gtk)
makedepends=(intltool
             gtk-doc
             gobject-introspection
             python-gobject
             itstool
             docbook-xsl
             git
             gnome-common
             meson)
optdepends=('devhelp: development help')
url="https://glade.gnome.org/"
source=("git+https://gitlab.gnome.org/GNOME/glade.git")
sha256sums=(SKIP)

pkgver() {
    cd glade
    git describe --long --tags | sed 's/^GLADE_//;s/_/./g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

# check() {
#     ninja -C build test
# }

build() {
    arch-meson glade build
    ninja -C build
}

package() {
    DESTDIR="$pkgdir/" ninja -C build install
}
