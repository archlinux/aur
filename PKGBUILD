# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: nl6720 <nl6720@archlinux.org>
# Contributor: Sebastian Lau <lauseb644@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Gerardo Exequiel Pozzi <djgera@archlinux.org>

pkgbase='archiso-git'
pkgname=('archiso-git' 'mkinitcpio-archiso-git')
pkgver=45.r37.gd7fc56e
pkgrel=1
pkgdesc='Tools for creating Arch Linux live and install iso images'
arch=('any')
url='https://gitlab.archlinux.org/archlinux/archiso'
license=('GPL')
makedepends=('git')
source=('git+https://gitlab.archlinux.org/archlinux/archiso.git')
validpgpkeys=('C7E7849466FE2358343588377258734B41C31549') # David Runge <dvzrv@archlinux.org>
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgbase%-git}"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package_archiso-git() {
  conflicts=("${pkgname%-git}")
  provides=("${pkgname%-git}=${pkgver}")
  depends=('arch-install-scripts' 'bash' 'dosfstools' 'e2fsprogs' 'edk2-shell' 'libisoburn' 'squashfs-tools')

  cd "${srcdir}/${pkgbase%-git}"
  make DESTDIR="${pkgdir}/" install
}

package_mkinitcpio-archiso-git() {
  pkgdesc='mkinitcpio hooks for archiso'
  conflicts=("${pkgname%-git}")
  provides=("${pkgname%-git}=${pkgver}")

  cd "${srcdir}/${pkgbase%-git}"
  make DESTDIR="${pkgdir}/" install-initcpio
}
