# Maintainer: Robert Wolff <mahlzahn@posteo.de>
pkgname=censor
pkgver=0.7.0
pkgrel=1
pkgdesc='PDF document redaction for the GNOME desktop'
arch=(x86_64)
url='https://codeberg.org/censor/Censor'
license=(GPL-3.0-or-later)
depends=(gtk4
         libadwaita
         python-gobject
         'python-pymupdf>=1.27.2')
makedepends=(meson
             ninja)
checkdepends=(appstream-glib)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=(29ec64344cc5a6ba691e6476a1722aad07e7071dc5776675a8ff9fca68df2a71)
validpgpkeys=()

blddir="$(pwd)/$pkgname-$pkgver-$pkgrel-build"

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
