# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: American_Jesus <american.jesus.pt AT gmail DOT com>
# Contributor: Suhaimi Ghazali <serdotlinecho AT gmail DOT com>
#
_pkgname="mconnect"
pkgname="${_pkgname}-git"
pkgver=409.210b435
pkgrel=1
pkgdesc="KDE Connect protocol implementation in Vala/C for non-KDE desktops"
arch=('i686' 'x86_64')
depends=('gtk3' 'libgee' 'gnutls' 'json-glib' 'libnotify')
makedepends=('at-spi2-atk' 'git' 'vala' 'json-glib' 'glib2' 'gobject-introspection' 'meson')
url="https://github.com/bboozzoo/mconnect"
license=('GPL2')
install="${pkgname}.install"
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=('mconnect::git+https://github.com/bboozzoo/mconnect.git#branch=master')
md5sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
    cd "${_pkgname}"
    mkdir build
}

build() {
    cd "${_pkgname}/build"
    arch-meson --prefix=/usr/
    ninja
}

package() {
    cd "$_pkgname/build"
    DESTDIR="$pkgdir" ninja install
} 

# vim: set ts=4 sw=4 et syn=sh ft=sh:
