# Maintainer: sripwoud <me@sripwoud.xyz>
_binname=trezord
_pkgname="${_binname}-runit"
pkgname="${_pkgname}-git"
pkgdesc="Runit service for Trezor Communication Daemon (aka Trezor Bridge)"
url="https://codeberg.org/sripwoud/${_pkgname}"
arch=('any')
depends=('runit' 'trezor-bridge-bin')
install="${_pkgname}.install"
license=('AGPL-3.0-only')
makedepends=('git')
pkgrel=3
pkgver="r10.b3e35ec"
sha256sums=('SKIP')
source=("git+${url}.git")

pkgver() {
    cd "${_pkgname}"
    # r<commit-count>.g<commit-hash>
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${_pkgname}"
    install -Dm755 "run" "${pkgdir}/etc/runit/sv/${_binname}/run"
}
