# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: nl6720 <nl6720@archlinux.org>

pkgname=mkinitcpio-archiso-git
pkgver=68.r0.gf0491c6
pkgrel=1
pkgdesc='Initcpio scripts used by archiso'
arch=('any')
url='https://gitlab.archlinux.org/archlinux/mkinitcpio/mkinitcpio-archiso'
license=('GPL-3.0-or-later')
depends=('bash' 'device-mapper' 'mkinitcpio')
makedepends=('git')
checkdepends=('shellcheck' 'shfmt')
optdepends=(
  'curl: for PXE over HTTP'
  'gnupg: for PGP signature verification of rootfs over PXE'
  'mkinitcpio-nfs-utils: for PXE over NFS'
  'nbd: for PXE over NBD'
  'openssl: for CMS signature verification of rootfs over PXE'
  'pv: for status display during copy to RAM'
)
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver}")
source=("git+https://gitlab.archlinux.org/archlinux/mkinitcpio/${pkgname%-git}.git?signed")
sha512sums=('SKIP')
validpgpkeys=(
  '991F6E3F0765CF6295888586139B09DA5BF0D338' # David Runge <dvzrv@archlinux.org>
  'BB8E6F1B81CF0BB301D74D1CBF425A01E68B38EF' # nl6720 <nl6720@gmail.com>
)

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

check() {
  cd "${pkgname%-git}"
  make -k check
}

package() {
  cd "${pkgname%-git}"
  make DESTDIR="${pkgdir}/" PREFIX='/usr' install
}
