# shellcheck disable=SC2034,SC2086,SC2128,SC2148,SC2154,SC2164
# Maintainer: Toria <ninetailedtori@uwu.gal>
# Maintainer: Amirreza Firoozi <firoozi128.af@gmail.com>
# Maintainer: Oleg Hahm <oleg+aur@riot-os.org>

_pkgname="wttr"
pkgname="${_pkgname}-git"
pkgver=1.55
pkgrel=1
pkgdesc="a simple script that checks the weather condition via http://wttr.in"
arch=('any')
url="https://github.com/cblte/bash-script-wttr"
license=('MIT')
makedepends=('git')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
depends=('curl')
source=("${_pkgname}::git+https://github.com/cblte/bash-script-wttr")

pkgver() {
    cd "${srcdir}/${_pkgname}"

    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "${srcdir}/${_pkgname}"

    mkdir -p "${pkgdir}/usr/bin/"
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}/"

    install -Dm0755 "wttr" "${pkgdir}/usr/bin/wttr"
    install -Dm0644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
