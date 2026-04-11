# Maintainer: Robert Wolff <mahlzahn@posteo.de>
pkgname=censor
pkgver=0.3.0
pkgrel=1
pkgdesc='PDF document redaction for the GNOME desktop'
arch=(x86_64)
url='https://codeberg.org/censor/Censor'
license=(GPL-3.0-or-later)
depends=(gtk4
         libadwaita
         python-gobject
         'python-pymupdf>=1.25.5')
makedepends=(meson
             ninja)
checkdepends=(appstream-glib)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=(84513d45966229ebfc0ebc48264fa62752cdd7197bfed262d7a04dd0c7eb6364)
validpgpkeys=()

blddir="$(pwd)/build"

build() {
    arch-meson "$blddir" "$srcdir/$pkgname"
    meson compile -C "$blddir"
}

check() {
    meson test -C "$blddir"
}

package() {
    meson install -C "$blddir" --destdir "$pkgdir"
}
