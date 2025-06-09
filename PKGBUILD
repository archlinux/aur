#!/usr/bin/makepkg -p

# Maintainer: dreieck

pkgbase="openttd-jgrpp-opendata"
pkgname=(
  "openttd-jgrpp-opengfx"
  "openttd-jgrpp-opensfx"
  "openttd-jgrpp-openmsx"
)
epoch=0
pkgver=20250609.01
pkgrel=2

pkgdesc="Metapackage which symlinks 'openttd-opengfx/opensfx/openmsx' such that 'openttd-jgrpp' can find them."
url="http://aur.archlinux.org/packages/openttd-jgrpp/"
license=('CC0-1.0')

arch=(
  'any'
)

makedepends=(
  'grep'
  'openttd-opengfx'
  'openttd-opensfx'
  'openttd-openmsx'
  'pacman'
)
optdepends=(
  'openttd-jgrpp: To make use of the symlinked data files by the actual game.'
)

options=('emptydirs')

source=(
  'COPYING'
)
sha256sums=(
  '90d77bbbe6aa2cfdaf6eaa3580fd1a981e0d0428ae586ac37b47aee5e67fcf12'
)

_openttd_share='/usr/share/openttd'
_openttd_jgrpp_share='/usr/share/openttd-jgrpp'
_openttd_datadir="${_openttd_share}/data"
_openttd_jgrpp_datadir="${_openttd_jgrpp_share}/data"
_openttd_gmdir="${_openttd_share}/gm"
_openttd_jgrpp_gmdir="${_openttd_jgrpp_share}/gm"

package_openttd-jgrpp-opengfx() {
  pkgdesc="Metapackage which symlinks 'openttd-opengfx' such that 'openttd-jgrpp' can find it."
  depends=(
    'openttd-opengfx'
  )

  install -dvm755 "${pkgdir}/${_openttd_jgrpp_datadir}"
  cd "${pkgdir}/${_openttd_jgrpp_datadir}"

  pacman -Qql openttd-opengfx | grep -E "^${_openttd_datadir}/.*[^/]\$" | while read _f; do
    ln -sv "${_f}" .
  done

  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" "${srcdir}/COPYING"
}

package_openttd-jgrpp-opensfx() {
  pkgdesc="Metapackage which symlinks 'openttd-opensfx' such that 'openttd-jgrpp' can find it."
  depends=(
    'openttd-opensfx'
  )

  install -dvm755 "${pkgdir}/${_openttd_jgrpp_datadir}"
  cd "${pkgdir}/${_openttd_jgrpp_datadir}"

  pacman -Qql openttd-opensfx | grep -E "^${_openttd_datadir}/.*[^/]\$" | while read _f; do
    ln -sv "${_f}" .
  done

  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" "${srcdir}/COPYING"
}

package_openttd-jgrpp-openmsx() {
  pkgdesc="Metapackage which symlinks 'openttd-openmsx' such that 'openttd-jgrpp' can find it."
  depends=(
    'openttd-openmsx'
  )

  install -dvm755 "${pkgdir}/${_openttd_jgrpp_gmdir}"
  cd "${pkgdir}/${_openttd_jgrpp_gmdir}"

  pacman -Qql openttd-openmsx | grep -E "^${_openttd_gmdir}/.*[^/]\$" | while read _f; do
    ln -sv "${_f}" .
  done

  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" "${srcdir}/COPYING"
}
