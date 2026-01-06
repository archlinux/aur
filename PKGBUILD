# Maintainer: Bouteiller a2n Alan <hi@a2n.dev>
pkgname=conar-bin
pkgver=0.25.0
pkgrel=1
pkgdesc="AI-powered tool for working with Postgres."
arch=('x86_64')
url="https://github.com/wannabespace/conar"
license=('AGPL-3.0-or-later')
depends=(
  'gcc-libs'
  'alsa-lib'
  'libxfixes'
  'libx11'
  'glib2'
  'libxkbcommon'
  'libxcb'
  'glibc'
  'nss'
  'libxrandr'
  'libxcomposite'
  'libcups'
  'mesa'
  'pango'
  'gtk3'
  'systemd-libs'
  'nspr'
  'cairo'
  'expat'
  'at-spi2-core'
  'libxdamage'
  'libxext'
  'dbus'
  'hicolor-icon-theme'
)
options=('!strip' '!emptydirs')
source_x86_64=("${url}/releases/download/v"${pkgver}"/Conar-Linux-"${pkgver}".deb")
sha256sums_x86_64=('41bec1c9e0a6e03951cdfbb1df93b4d316f18aeabaaf274b69887dcd2d36304a')
package() {
  # Extract the .deb file
  ar -x "${srcdir}/Conar-Linux-${pkgver}.deb"

  # Extract the data archive
  tar -xJ -f data.tar.xz -C "${pkgdir}"

  # Create symlink for command line usage
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/Conar/Conar" "${pkgdir}/usr/bin/conar"

  # Fix desktop file path if it exists
  if [ -f "${pkgdir}/usr/share/applications/conar.desktop" ]; then
    sed -i 's|/opt/Conar/Conar|conar|g' "${pkgdir}/usr/share/applications/conar.desktop"
  fi
}
