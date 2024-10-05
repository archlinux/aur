# shellcheck shell=bash
# Maintainer: Silvio Knizek <killermoehre@gmx.net>
# Contributor: Evangelos Foutras <foutrelis@archlinux.org>
# Contributor: Robin Candau <antiz@archlinux.org>
# Contributor: tobias <tobias funnychar archlinux.org>

_pkgname=xfconf
pkgname="${_pkgname}-git"
pkgver=4.19.2+14+g4593943
pkgrel=3
pkgdesc="D-Bus-based configuration storage system - git checkout"
arch=('i686' 'x86_64')
url="https://docs.xfce.org/xfce/${_pkgname}/start"
license=('GPL-2.0-or-later')
groups=('xfce4')
depends=('libxfce4util')
makedepends=('git' 'glib2-devel' 'intltool' 'gobject-introspection' 'vala' "xfce4-dev-tools>=${pkgver%.*}")
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("git+https://gitlab.xfce.org/xfce/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}" || return 1
  git describe --long --tags | sed -r "s:^${_pkgname}.::;s/^v//;s/^xfce-//;s/-/+/g"
}

prepare() {
  cd "${_pkgname}" || return 1
  ./autogen.sh \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --enable-gtk-doc \
    --disable-debug
}

build() {
  cd "${_pkgname}" || return 1
  make
}

package() {
  cd "${_pkgname}" || return 1
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
