# Maintainer: javabetatester <birisesports@gmail.com>
pkgname=hydra-ensemble-bin
_pkgname=hydra-ensemble
pkgver=0.1.1
pkgrel=1
pkgdesc="Cross-platform multi-session terminal for Claude Code"
arch=('x86_64')
url="https://hydra-ensemble.xyz"
license=('MIT')
depends=('gtk3' 'nss' 'alsa-lib' 'libxss' 'libxtst')
optdepends=('github-cli: PR Inspector feature')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip')
source=("hydra-ensemble-0.1.1.AppImage::https://github.com/javabetatester/hydra-ensemble/releases/download/v0.1.1/Hydra.Ensemble-0.1.1.AppImage")
sha256sums=('114b3c086d07de4765c4f06eb38314da64231cd385e12472306e0e51a651f600')
noextract=("${_pkgname}-${pkgver}.AppImage")

package() {
  install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" \
                 "${pkgdir}/opt/${_pkgname}/${_pkgname}.AppImage"
  install -Dm644 "${srcdir}/${_pkgname}.desktop" \
                 "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  # Icon in hicolor theme (where the .desktop Icon=hydra-ensemble key
  # resolves) plus pixmaps as a legacy fallback for DEs that ignore the
  # theme lookup.
  install -Dm644 "${srcdir}/${_pkgname}.png" \
                 "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"
  install -Dm644 "${srcdir}/${_pkgname}.png" \
                 "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${_pkgname}/${_pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
}
