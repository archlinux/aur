# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

# shellcheck disable=SC2034
_pkg="archiso"
_pkgbase="${_pkg}-profiles"
_profile=desktop
pkgname="archlinux-${_profile}"
pkgver=v0.1+7+g3359a3e
pkgrel=1
pkgdesc='Builds an Archlinux desktop'
arch=('any')
license=('GPL3')
url="https://gitlab.archlinux.org/tallero/${_pkgbase}"
depends=('cryptsetup-nested-cryptkey'
	 'dwm'
	 'fakepkg'
	 'mkinitcpio-archiso-encryption-git'
	 'plymouth-nested-cryptkey'
         'polkit')
makedepends=('devtools' 'git')
checkdepends=('shellcheck')
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "archiso-profiles" || exit
  git describe --tags | sed 's/-/+/g'
}

package() {
  # shellcheck disable=SC2154
  local _profile="${_pkgbase}/${_profile}"
  cd "${_profile}" || exit

  ./build_repo.sh fakepkg
  # pkexec mkarchiso -v "./" # ${_profile}"
}
