# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: nl6720 <nl6720@archlinux.org>
# Contributor: Sebastian Lau <lauseb644@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Gerardo Exequiel Pozzi <djgera@archlinux.org>

pkgbase='archiso-git'
pkgname=('archiso-git' 'mkinitcpio-archiso-git')
pkgver=46.r0.g945f383
pkgrel=1
pkgdesc='Tools for creating Arch Linux live and install iso images'
arch=('any')
url="https://gitlab.archlinux.org/archlinux/archiso"
license=('GPL3')
makedepends=('git')
source=('git+https://gitlab.archlinux.org/archlinux/archiso.git')
validpgpkeys=('C7E7849466FE2358343588377258734B41C31549') # David Runge <dvzrv@archlinux.org>
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgbase%-git}"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package_archiso-git() {
  depends=('arch-install-scripts' 'bash' 'dosfstools' 'e2fsprogs' 'libisoburn'
  'squashfs-tools')
  optdepends=('edk2-ovmf: for emulating UEFI with run_archiso'
              'qemu: for run_archiso')
  conflicts=("${pkgname%-git}")
  provides=("${pkgname%-git}=${pkgver}")

  cd "${srcdir}/${pkgbase%-git}"
  make DESTDIR="${pkgdir}/" install
}

package_mkinitcpio-archiso-git() {
  pkgdesc='Mkinitcpio hooks and scripts for archiso'
  depends=('mkinitcpio')
  conflicts=("${pkgname%-git}")
  provides=("${pkgname%-git}=${pkgver}")

  cd "${srcdir}/${pkgbase%-git}"
  make DESTDIR="${pkgdir}/" install-initcpio
}
