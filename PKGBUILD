# Maintainer: David Runge <dvzrv@archlinux.org>

_name=mkinitcpio-archiso
pkgname=mkinitcpio-archiso-git
pkgver=v58.r0.gbdad4a1
pkgrel=1
pkgdesc="Initcpio scripts used by archiso"
arch=('any')
url="https://gitlab.archlinux.org/mkinitcpio/mkinitcpio-archiso"
license=('GPL3')
depends=('bash' 'device-mapper' 'mkinitcpio')
makedepends=('git')
checkdepends=('shellcheck' 'shfmt')
optdepends=(
  'curl: for PXE over HTTP'
  'mkinitcpio-nfs-utils: for PXE over NFS'
  'nbd: for PXE over NBD'
  'pv: for status display during copy to RAM'
)
conflicts=("${_name}")
provides=("${_name}=${pkgver}")
source=("$pkgname::git+https://gitlab.archlinux.org/mkinitcpio/${_name}.git?signed")
sha256sums=('SKIP')
validpgpkeys=('C7E7849466FE2358343588377258734B41C31549') # David Runge <dvzrv@archlinux.org>

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

check() {
  cd "$pkgname"
  make -k check
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir/" PREFIX='/usr' install
}
