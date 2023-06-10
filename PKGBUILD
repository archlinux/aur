# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: David Runge <dvzrv@archlinux.org>

# shellcheck disable=SC2034
_pkgbase="mkinitcpio-archiso"
variant="encryption"
pkgname="${_pkgbase}-${variant}"
pkgver=v65
pkgrel=1
pkgdesc="Initcpio scripts used by archiso (encrypt hook support)"
arch=(any)
_gitlab="https://gitlab.archlinux.org"
url="${_gitlab}/mkinitcpio/mkinitcpio-archiso/-/merge_requests/25"
license=(GPL3)
depends=(bash device-mapper mkinitcpio cryptsetup)
conflicts=("${_pkgbase}")
provides=("${_pkgbase}")
makedepends=(git)
checkdepends=(shellcheck shfmt)
optdepends=(
  'curl: for PXE over HTTP'
  'mkinitcpio-nfs-utils: for PXE over NFS'
  'nbd: for PXE over NBD'
  'pv: for status display during copy to RAM'
)
_commit="aef089395300e9ec9c4f15d8c7f952af8d481c86"
source=("${_pkgbase}::git+${_gitlab}/tallero/${_pkgbase}.git#commit=${_commit}")
sha256sums=('SKIP')

check() {
  make -k check -C "${_pkgbase}"
}

package() {
  make DESTDIR="$pkgdir/" PREFIX=/usr install -C "${_pkgbase}"
}
