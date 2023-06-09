# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Gerardo Exequiel Pozzi <djgera@archlinux.org>

# shellcheck disable=SC2034
_pkgbase=archiso
_variant="encryption"
_pkgname="${_pkgbase}-${_variant}"
pkgname="${_pkgname}-git"
pkgver=v70.r281.g7ef55d0
pkgrel=1
pkgdesc='Tools for creating Arch Linux live and install ISO images (LUKS image type support).'
arch=('any')
license=('GPL3')
_url=https://gitlab.archlinux.org/tallero/${_pkgbase}
url="https://gitlab.archlinux.org/archlinux/archiso/-/issues/156"
depends=('arch-install-scripts' 'bash' 'dosfstools' 'e2fsprogs' 'erofs-utils'
'libarchive' 'libisoburn' 'mtools' 'squashfs-tools' 'cryptsetup-nested-cryptkey')
makedepends=('git')
checkdepends=('shellcheck')
provides=("${_pkgbase}")
provides+=("${_pkgbase}-${_variant}")
provides+=("${_pkgbase}-persistent-git")
provides+=("an${_pkgbase}")
conflicts=("${_pkgbase}")
conflicts+=("${_pkgbase}-${_variant}")
conflicts+=("${_pkgbase}-persistent-git")
conflicts+=("an${_pkgbase}")
optdepends=(
  'archiso-profiles: extra profiles for archiso'
  'edk2-ovmf: for emulating UEFI with run_archiso'
  'openssl: for codesigning support when building netboot artifacts'
  'qemu: for run_archiso'
)
source=("${_pkgbase}::git+${_url}#branch=raid")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgbase}" || exit
  echo "v$(git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}

check() {
  cd "${_pkgbase}" || exit
  make -k check
}

# shellcheck disable=SC2154
package() {
  cd "${_pkgbase}" || exit
  make DESTDIR="${pkgdir}" PREFIX='/usr' install
}
