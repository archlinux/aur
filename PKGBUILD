# Maintainer: Kamil cukrowski <kmilcukrowski@gmail.com>
pkgname=podpisgov
pkgver=0.0.1 # Please update pkgver manually if a newer version is released
pkgrel=1
pkgdesc="An application for digital signatures by Poland government."
arch=('x86_64')
url="https://podpis.gov.pl/ui/wp/podpis-gov"
license=('CC-BY-NC-4.0' 'LGPL-3.0-only' 'GPL-3.0-only')
depends=('libappindicator-gtk2')
source=("${pkgname}.tar.gz::https://pz.gov.pl/PodpisGOV/linux/PodpisGOV.tar.gz")
sha256sums=('0a6f5aa745b12c64be33c62822bd0efed355444c08accf60d2d28ce1a1ee8d1e')

mkdir_link() {
  echo "$2 -> $1"
  install -d "$(dirname "$2")"
  ln -s "$@"
}

package() {
  # This path is hardocded in the desktop link.
  local mydir="${pkgdir}/opt/PodpisGOV"
  # Create the installation directory
  install -d "${mydir}"
  # Move the extracted content to the target directory
  mv "${srcdir}/PodpisGOV/"* "${mydir}/"
  # Install executable.
  mkdir_link "${mydir}/PodpisGOV" "${pkgdir}/usr/bin/PodpisGOV"
  # Install the desktop file
  mkdir_link "${mydir}/PodpisGOV.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  # Install the license file
  mkdir_link "${mydir}/Licenses/License-pl.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
