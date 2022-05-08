# Maintainer: ndom91
# Contributor: Drata
# Contributor: otaj
pkgname=drata-agent
pkgver=3.1.0
pkgrel=6
pkgdesc="The Drata Agent is a light-weight tray-application that runs in the background, reporting important read-only data to Drata about your machine’s state for compliance tracking."
arch=('x86_64')
url="https://github.com/drata/the-agent"
license=('unknown')
depends=('at-spi2-core' 'desktop-file-utils' 'gtk3' 'hicolor-icon-theme' 'libnotify' 'libsecret' 'libxss' 'libxtst' 'nss' 'util-linux-libs' 'xdg-utils')
makedepends=('binutils')
optdepends=('libappindicator-gtk3')
options=('!strip' '!emptydirs')
install=${pkgname}.install
validpgpkeys=('2DCE07BE62610800B1E4BEDE955D29B1F039BC43')
source_x86_64=("https://cdn.drata.com/agent/dist/linux/${pkgname}-${pkgver}.deb")
sha512sums_x86_64=('8f09e9480b0d7531b6e2dfaa72ba086ca0f6f177daa93fa3aec79ecec3e33bab33ca8dca51df6d935928b1488a4af6b1f393111b59294860a4c1e786b6615712')

package(){
  cd "${srcdir}"

  # Extract debian package
  ar xf ${pkgname}-${pkgver}.deb

  # Extract data to pkgdir
  tar xf data.tar.xz -C "${pkgdir}/"

  # Install license file
  license_file="${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  if [[ -f "$license_file" ]]; then
    rm "$license_file"
  fi
  install -D -m644 "${pkgdir}/opt/Drata Agent/LICENSES.chromium.html" "$license_file"
}
