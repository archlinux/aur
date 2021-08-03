# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: nl6720 <nl6720@archlinux.org>
# Contributor: Sebastian Lau <lauseb644@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Gerardo Exequiel Pozzi <djgera@archlinux.org>

pkgname=archiso-git
pkgver=57.r5.g0f3a83a
pkgrel=1
pkgdesc='Tools for creating Arch Linux live and install iso images'
arch=('any')
url='https://gitlab.archlinux.org/archlinux/archiso'
license=('GPL3')
depends=('arch-install-scripts' 'bash' 'dosfstools' 'libisoburn' 'mtools'
'squashfs-tools')
makedepends=('git')
checkdepends=('shellcheck')
optdepends=(
  'edk2-ovmf: for emulating UEFI with run_archiso'
  'erofs-utils: for EROFS based airootfs image'
  'e2fsprogs: for dm-snapshot based airootfs image'
  'qemu: for run_archiso'
)
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver}")
source=("git+https://gitlab.archlinux.org/archlinux/${pkgname%-git}.git?signed")
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
