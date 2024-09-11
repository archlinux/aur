#!/usr/bin/bash
# Maintainer: Silvio Knizek <killermoehre@gmx.net>

_pkgname=xfconf
pkgname="${_pkgname}-git"
pkgver=4.19.2+14+g4593943
pkgrel=1
pkgdesc="D-Bus-based configuration storage system - git checkout"
arch=('i686' 'x86_64')
url="https://docs.xfce.org/xfce/${_pkgname}/start"
license=('GPL2')
groups=('xfce4')
depends=('libxfce4util')
makedepends=('intltool' 'gobject-introspection' 'vala' 'git' 'xfce4-dev-tools>=4.19' 'glib2-devel')
provides=("${_pkgname}=${pkgver}")
conflicts=("$_pkgname")
source=("git+https://gitlab.xfce.org/xfce/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}" || return 1
    git describe --long --tags | sed -r "s:^${_pkgname}.::;s/^v//;s/^xfce-//;s/-/+/g"
}

build() {
    cd "${srcdir}/${_pkgname}" || return 1
    ./autogen.sh \
        --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var
    make
}

package() {
    cd "${srcdir}/${_pkgname}" || return 1
    make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
