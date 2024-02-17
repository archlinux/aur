# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: nl6720 <nl6720@archlinux.org>
# Contributor: Sebastian Lau <lauseb644@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Gerardo Exequiel Pozzi <djgera@archlinux.org>

pkgname=archiso-git
pkgver=75.r2.g2932a9d
pkgrel=1
pkgdesc='Tools for creating Arch Linux live and install iso images'
arch=('any')
url='https://gitlab.archlinux.org/archlinux/archiso'
license=('GPL-3.0-or-later')
depends=('arch-install-scripts' 'bash' 'dosfstools' 'e2fsprogs' 'erofs-utils' 'grub' 'libarchive' 'libisoburn' 'mtools' 'squashfs-tools')
makedepends=('git' 'python-docutils')
checkdepends=('shellcheck')
optdepends=(
  'edk2-ovmf: for emulating UEFI with run_archiso'
  'gnupg: for PGP signature verification of rootfs over PXE'
  'openssl: for CMS signature verification of PXE artifacts and rootfs over PXE'
  'qemu-desktop: for run_archiso'
)
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver}")
source=("git+https://gitlab.archlinux.org/archlinux/${pkgname%-git}.git?signed")
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
