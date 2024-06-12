# Maintainer: Santiago Burgos <santiago.burgos1089@gmail.com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Ainola

pkgname=celluloid-linuxmint
_pkgname=celluloid
pkgver=0.21
_pkgver=wilma
pkgrel=1
pkgdesc='Simple GTK+ frontend for mpv. Linux Mint version'
arch=('x86_64')
url='https://celluloid-player.github.io/'
license=('GPL3')
depends=(
    'gtk3'
    'mpv'
)
makedepends=(
    'appstream-glib'
    'meson'
)
provides=(
    ${_pkgname}
    'celluloid-gtk3'
)
conflicts=(
    ${_pkgname}
    'celluloid-gtk3'
)
replaces=(
    'gnome-mpv'
)
source=("http://packages.linuxmint.com/pool/upstream/c/${_pkgname}/${_pkgname}_${pkgver}+mint2+${_pkgver}.tar.xz")
sha256sums=('4276366a2e3d731291129c77b249f49b9c0212a8f0654993d816abbe8a2dd841')

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
