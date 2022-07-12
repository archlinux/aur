# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: David Runge <dvzrv@archlinux.org>

# shellcheck disable=SC2034
_pkgname=mkinitcpio-archiso
pkgname=$_pkgname-encryption
pkgver=v65
pkgrel=1
pkgdesc="Initcpio scripts used by archiso (encrypt hook support)"
arch=(any)
_gitlab="https://gitlab.archlinux.org"
url="${_gitlab}/mkinitcpio/mkinitcpio-archiso/-/merge_requests/25"
license=(GPL3)
depends=(bash device-mapper mkinitcpio cryptsetup)
conflicts=('mkinitcpio-archiso')
provides=('mkinitcpio-archiso')
makedepends=(git)
checkdepends=(shellcheck shfmt)
optdepends=(
  'curl: for PXE over HTTP'
  'mkinitcpio-nfs-utils: for PXE over NFS'
  'nbd: for PXE over NBD'
  'pv: for status display during copy to RAM'
)
source=("${pkgname}::git+${_gitlab}/tallero/${_pkgname}.git#tag=${pkgver}")
sha256sums=('SKIP')

# shellcheck disable=SC2154
check() {
  make -k check -C $pkgname
}

package() {
  make DESTDIR="$pkgdir/" PREFIX=/usr install -C $pkgname
}
