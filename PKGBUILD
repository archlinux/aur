# Maintainer: torculus <20175597+torculus@users.noreply.github.com>
# Contributor: torculus <20175597+torculus@users.noreply.github.com>

pkgname=draughts
pkgver=2.1.1
pkgrel=1
license=('GPL-3.0-or-later')
pkgdesc='A comprehensive draughts (checkers) game for GNOME.'
url='https://github.com/tobagin/Draughts'
arch=('x86_64' 'aarch64')
depends=('gtk4' 'libadwaita' 'gdk-pixbuf2' 'libgee' 'json-glib' 'libsoup3' 'dconf' 'glibc' 'glib2' 'cairo' 'hicolor-icon-theme' 'gstreamer')
makedepends=('meson' 'vala' 'blueprint-compiler' 'itstool')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('9541b2a32cc9ccd3f66d821bb5ed724d789e9871aeee5fc8a925d1c02d14765e89ec17cf7f49843a1135640eb39a11618375a2703cdd3e13a45d2da99ccb9af6')

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
