# Maintainer: Felipe BF <fprgw32 at gmail dot com>
# Contributor: torculus <20175597+torculus@users.noreply.github.com>

pkgname=draughts
pkgver=2.4.0
pkgrel=1
license=('GPL-3.0-or-later')
pkgdesc='A comprehensive draughts (checkers) game for GNOME.'
url='https://github.com/tobagin/Draughts'
arch=('x86_64' 'aarch64')
depends=(
    'gtk4'
    'libadwaita'
    'gdk-pixbuf2'
    'libgee'
    'json-glib'
    'libsoup3'
    'dconf'
    'glibc'
    'glib2'
    'cairo'
    'hicolor-icon-theme'
    'gstreamer'
)
makedepends=(
    'meson'
    'vala'
    'blueprint-compiler'
    'itstool'
)

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('66d30a92af0b5d47bcabe09ea0fda7febddb987799c9dad2d7f1392861b9c93b2c8af822a3486a3058caac49e2aa89c578a1e58dd8ad36897e4f47ef3359ab26')

prepare() {
    # delete glib-compile-schemas from install
    sed -i '87d' ${srcdir}/Draughts-${pkgver}/data/meson.build
}

build() {
    arch-meson Draughts-${pkgver} build
    meson compile -C build
}

check() {
    meson test -C build --print-errorlogs
}

package() {
    meson install -C build --destdir "$pkgdir"
}

