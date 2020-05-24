# Maintainer: simon1573 <arch@tuxflux.se>

_pkgname=polybar-mullvad
pkgname=${_pkgname}-git
pkgver=r10.3eeff2f
pkgrel=1
pkgdesc='A module for showing connection status of the Mullvad VPN service.'
arch=(any)
url=https://github.com/simon1573/${_pkgname}
license=('MIT')
makedepends=(git)
depends=('mullvad-vpn-cli')
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  set -o pipefail
  git describe --long 2> /dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd ${_pkgname}
  install -Dm644 README.md "${pkgdir}"/usr/share/doc/${_pkgname}/README.md
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${_pkgname}/LICENSE
  install -Dm755 mullvad-status.sh "${pkgdir}"/usr/share/polybar/scripts/mullvad-status.sh
}

