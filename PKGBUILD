# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: David Runge <dvzrv@archlinux.org>

_pkgname=mkinitcpio-archiso
pkgname=$_pkgname-encryption
pkgver=63
pkgrel=1
pkgdesc="Initcpio scripts used by archiso"
arch=(any)
url="https://gitlab.archlinux.org/tallero/mkinitcpio-archiso"
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
source=("${pkgname}::git+https://gitlab.archlinux.org/tallero/${_pkgname}.git#branch=crypto")
sha256sums=('SKIP')

check() {
  make -k check -C $pkgname
}

package() {
  make DESTDIR="$pkgdir/" PREFIX=/usr install -C $pkgname
}
