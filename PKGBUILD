# Maintainer: Santiago Burgos <santiago.burgos1089@gmail.com>
# Contributor: Fabian Bornschein <fabiscafe@archlinux.org>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=simple-scan-linuxmint
_pkgname=simple-scan
pkgver=46.0
_pkgver=zena
pkgrel=1
pkgdesc="Simple scanning utility. Linux Mint version"
url="https://gitlab.gnome.org/GNOME/simple-scan"
arch=(x86_64)
license=(GPL-3.0-or-later)
depends=(
    'cairo'
    'colord-sane'
    'dconf'
    'gdk-pixbuf2'
    'glib2'
    'glibc'
    'gtk4'
    'hicolor-icon-theme'
    'libadwaita'
    'libcolord'
    'libgusb'
    'libwebp'
    'sane'
    'zlib'
)
makedepends=(
    'meson'
    'vala'
    'yelp-tools'
)
provides=(
    ${_pkgname}
)
conflicts=(
    ${_pkgname}
)
source=("http://packages.linuxmint.com/pool/upstream/s/${_pkgname}/${_pkgname}_${pkgver}-0ubuntu2.1mint1+${_pkgver}.tar.xz")
sha256sums=('11e97568177b7bdf25b1e6669ef9c1937891582ad4d9b2280428a84aae41b5a1')

prepare() {
    cd $_pkgname
}

build() {
    arch-meson $_pkgname build
    meson compile -C build
}

check() {
    meson test -C build --print-errorlogs
}

package() {
    meson install -C build --destdir "$pkgdir"
}
