# Maintainer: dreieck
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Link Dupont <link@subpop.net>

_url="https://raw.githubusercontent.com/gentoo/gentoo/master"

pkgname=dbus-openrc-initscript
pkgver=1.10.10
pkgrel=2
pkgdesc="OpenRC init script for dbus.Freedesktop.org message bus system"
url="https://wiki.freedesktop.org/www/Software/dbus/"
arch=("any")
license=("GPL2")
provides=("dbus-openrc=${pkgver}")
replaces=("dbus-openrc<10.10.10")
depends=("dbus>=1.10")
makedepends=()
conflicts=("dbus-openrc")
install='dbus.install'
source=(
  "dbus.initd::${_url}/sys-apps/dbus/files/dbus.initd-r1"
  "dbus.install"
)
sha256sums=(
  '4491c09942d72fd464bc1da286c4f5a237ec8debfbaba83c6fbf4a46d46fe51e'
  '03944588f0a4c90f4bcfac96f5bc380473473d65d88d6c2c54b7397fe1103396'
)

_inst_initd(){
    install -Dm755 "${srcdir}/$1.initd" "${pkgdir}/etc/init.d/$1"

    sed -e 's|#!/sbin/runscript|#!/usr/bin/openrc-run|' \
            -e 's|#!/sbin/openrc-run|#!/usr/bin/openrc-run|' \
            -e 's|/var/run|/run|g' \
            -e 's|dbus.pid|dbus/pid|g' \
            -i "${pkgdir}/etc/init.d/$1"
}

package() {
    _inst_initd 'dbus'
}
