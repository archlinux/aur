# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

# shellcheck disable=SC2034
_pkg="archiso"
_distro="archlinux"
_pkgbase="${_pkg}-profiles"
profile="desktop"
_pkgname="${_distro}-${profile}"
pkgname=("${_pkgname}-gce")
pkgver="$(date +%Y.%m.%d)"
pkgrel=1
pkgdesc="Builds an Archlinux desktop for import in Google Compute Engine."
arch=('i686'
      'pentium4'
      'x86_64')
license=('AGPL3')
url="https://gitlab.${_distro}.org/tallero/${_pkgbase}"
makedepends=("${_pkgname}")
checkdepends=('shellcheck')

## shellcheck disable=SC2154
package() {
  local _dest="${pkgdir}/usr/share/${_distro}"
  local _iso_name="/usr/share/${_distro}/${_pkgname}-x86_64.iso"
  rm -rf "${_dest}"
  mkdir -p "${_dest}"
  cp "${_iso_name}" disk.raw
  tar --format=oldgnu -Sczf "${_dest}/${_pkgname}.tar.gz" disk.raw 
}
