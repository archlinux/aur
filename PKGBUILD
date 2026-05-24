# Maintainer: Ignacio Taranto <ignacio_taranto at protonmail dot com>
# shellcheck shell=bash disable=2034,2154,2164

_pkgname="qogir-icon-theme"
pkgname="${_pkgname}-no-apps-git"
pkgver=2025.02.15.r26.gc633057
pkgrel=2
pkgdesc='A colorful design icon theme for linux desktops'
arch=(any)
url='https://github.com/vinceliuice/Qogir-icon-theme'
license=(GPL-3.0-or-later)
depends=()
makedepends=(git gtk-update-icon-cache)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}")
sha256sums=(SKIP)
options=(!strip !debug)

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "${srcdir}/${_pkgname}"
    mkdir -p "${pkgdir}/usr/share/icons"
    ./install.sh --dest "${pkgdir}/usr/share/icons" --theme default --noapp
    install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

# vim:ft=bash
