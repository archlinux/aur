# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

# shellcheck disable=SC2034
_pkg="archiso"
_pkgbase="${_pkg}-profiles"
_profile=desktopbase
_pkgname="archlinux-${_profile}"
pkgname="${_pkgname}-git"
pkgver=v0.1
pkgrel=1
pkgdesc='Builds a base Archlinux desktop'
arch=('any')
license=('GPL3')
url="https://gitlab.archlinux.org/tallero/${_pkgbase}"
depends=('cryptsetup-nested-cryptkey'
	 'dwm'
	 'fakepkg'
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

  bash build_repo.sh fakepkg
  # pkexec mkarchiso -v "./" # ${_profile}"
}
