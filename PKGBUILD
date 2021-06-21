# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: American_Jesus <american.jesus.pt AT gmail DOT com>
# Contributor: Suhaimi Ghazali <serdotlinecho AT gmail DOT com>
#
_pkgname="mconnect"
pkgname="${_pkgname}-git"
pkgver=417.81dc247
pkgrel=1
pkgdesc="KDE Connect protocol implementation in Vala/C for non-KDE desktops"
arch=('i686' 'x86_64')
depends=('gtk3' 'libgee' 'gnutls' 'json-glib' 'libnotify')
makedepends=('at-spi2-atk' 'gdb' 'git' 'vala' 'json-glib' 'glib2' 'gobject-introspection' 'meson')
url="https://github.com/grimpy/mconnect"
license=('GPL2')
install="${pkgname}.install"
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!emptydirs')
source=("mconnect::git+${url}.git#branch=master")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
    cd "${_pkgname}"
    mkdir build
}

build() {
    cd "${_pkgname}"
    arch-meson build --prefix=/usr/
    ninja -C build
}

package() {
    cd "${_pkgname}"
    DESTDIR="${pkgdir}" ninja -C build install

    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
} 

# vim: set ts=4 sw=4 et syn=sh ft=sh:
