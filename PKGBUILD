# Maintainer: Santiago Burgos <santiago.burgos1089@gmail.com>
# Contributor: Fabian Bornschein <fabiscafe@archlinux.org>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=simple-scan-linuxmint
_pkgname=simple-scan
pkgver=44.0
_pkgver=wilma
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
    'gtk3'
    'hicolor-icon-theme'
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
    simple-scan-gtk3
)
conflicts=(
    ${_pkgname}
    simple-scan-gtk3
)
source=("http://packages.linuxmint.com/pool/upstream/s/${_pkgname}/${_pkgname}_${pkgver}-${pkgrel}+${_pkgver}.tar.xz")
sha256sums=('c5234d912f2aa0e170f364f142939d8827a7be519b5ee3d0e734939b755021d8')

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
