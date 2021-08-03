# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: nl6720 <nl6720@archlinux.org>

pkgname=mkinitcpio-archiso-git
pkgver=58.r0.gbdad4a1
pkgrel=1
pkgdesc='Initcpio scripts used by archiso'
arch=('any')
url='https://gitlab.archlinux.org/mkinitcpio/mkinitcpio-archiso'
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
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver}")
source=("git+https://gitlab.archlinux.org/mkinitcpio/${pkgname%-git}.git?signed")
sha512sums=('SKIP')
validpgpkeys=('C7E7849466FE2358343588377258734B41C31549') # David Runge <dvzrv@archlinux.org>

pkgver() {
  cd "${pkgname%-git}"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

check() {
  cd "${pkgname%-git}"
  make -k check
}

package() {
  cd "${pkgname%-git}"
  make DESTDIR="${pkgdir}/" PREFIX='/usr' install
}
