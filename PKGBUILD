# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
_profile=desktop
pkgname="archlinux-${_profile}"
pkgver=v1
pkgrel=1
pkgdesc='Builds an Archlinux desktop'
arch=('any')
license=('GPL3')
url="https://gitlab.archlinux.org/tallero/archiso-profiles"
depends=('polkit' 'archiso-profiles')
makedepends=('git')
checkdepends=('shellcheck')
source=("git+https://gitlab.archlinux.org/tallero/archiso-profiles")
sha256sums=('SKIP')

pkgver() {
  cd "archiso-profiles" || exit
  git describe --tags | sed 's/-/+/g'
}

package() {
  local _profile="archiso-profiles/${_profile}"
  cd "${_profile}" || exit
  bash build_repo.sh
  pkexec mkarchiso -v "${_profile}"
}
