# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Gerardo Exequiel Pozzi <djgera@archlinux.org>

_pkgname=archiso
pkgname=$_pkgname-encryption-git
pkgver=v58+214+gee08b3c
pkgrel=1
pkgdesc='Tools for creating Arch Linux live and install iso images with luks'
arch=('any')
license=('GPL3')
url="https://gitlab.archlinux.org/archlinux/archiso/-/issues/156"
depends=('arch-install-scripts' 'bash' 'dosfstools' 'e2fsprogs' 'erofs-utils'
'libarchive' 'libisoburn' 'mtools' 'squashfs-tools' 'cryptsetup-nested-cryptkey')
makedepends=('git')
checkdepends=('shellcheck')
replaces=('archiso' 'archiso-encryption')
conflicts=('archiso' 'archiso-encryption')
optdepends=(
  'archiso-profiles: extra profiles for archiso'
  'edk2-ovmf: for emulating UEFI with run_archiso'
  'openssl: for codesigning support when building netboot artifacts'
  'qemu: for run_archiso'
)
source=("git+https://gitlab.archlinux.org/tallero/${_pkgname}#branch=crypto")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

check() {
  cd "${_pkgname}"
  make -k check
}

package() {
  cd "${_pkgname}"
  make DESTDIR="${pkgdir}" PREFIX='/usr' install
}
