# Maintainer: Santiago Burgos <santiago.burgos1089@gmail.com>
# Contributor: Fabian Bornschein <fabiscafe@archlinux.org>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=gnome-system-monitor-linuxmint
_pkgname=gnome-system-monitor
pkgver=45.0.2
_pkgver=wilma
pkgrel=2
pkgdesc="View current processes and monitor system state. Linux Mint version"
url="https://wiki.gnome.org/Apps/SystemMonitor"
arch=(x86_64)
license=(GPL-2.0-or-later)
depends=(
    'cairo'
    'dconf'
    'gcc-libs'
    'gdk-pixbuf2'
    'glib2'
    'glibc'
    'glibmm-2.68'
    'graphene'
    'gtk3'
    'gtkmm3'
    'hicolor-icon-theme'
    'libgtop'
    'librsvg'
    'libsigc++-3.0'
    'pango'
    'polkit'
    'systemd'
    'systemd-libs'
)
makedepends=(
    'appstream-glib'
    'glib2-devel'
    'meson'
    'yelp-tools'
)
provides=(
    ${_pkgname}
    gnome-system-monitor-gtk3
)
conflicts=(
    ${_pkgname}
    gnome-system-monitor-gtk3
)
#source=("http://packages.linuxmint.com/pool/upstream/g/${_pkgname}/${_pkgname}_${pkgver}-${pkgrel}+${_pkgver}.tar.xz")
source=("http://packages.linuxmint.com/pool/upstream/g/${_pkgname}/${_pkgname}_${pkgver}-1+${_pkgver}.tar.xz")
sha256sums=('700c60314b195bcee08c5e73b439bb5e41e8fc28e5732c02e4a36386bcd5742d')

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
