# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Gerardo Exequiel Pozzi <djgera@archlinux.org>

_pkgbase=archiso
_variant="encryption"
pkgname="${_pkgbase}-${_variant}"
pkgver=v65
pkgrel=1
pkgdesc='Tools for creating Arch Linux live and install iso images with luks'
arch=('any')
license=('GPL3')
url="https://gitlab.archlinux.org/archlinux/archiso/-/issues/156"
depends=('arch-install-scripts' 'bash' 'dosfstools' 'e2fsprogs' 'erofs-utils'
'libarchive' 'libisoburn' 'mtools' 'squashfs-tools' 'cryptsetup-nested-cryptkey')
makedepends=('git')
checkdepends=('shellcheck')
provides=("${_pkgbase}")
conflicts=("${_pkgbase}")
optdepends=(
  'archiso-profiles: extra profiles for archiso'
  'edk2-ovmf: for emulating UEFI with run_archiso'
  'openssl: for codesigning support when building netboot artifacts'
  'qemu: for run_archiso'
)
_commit="ee08b3c97344ef7a3ea293456a64cd97b9b85262"
source=("${_pkgbase}::git+https://gitlab.archlinux.org/tallero/${_pkgname}#commit=${_commit}")
sha256sums=('SKIP')

check() {
  cd "${_pkgbase}"
  make -k check
}

package() {
  cd "${_pkgbase}"
  make DESTDIR="${pkgdir}" PREFIX='/usr' install
}
