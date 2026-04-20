# Maintainer: javabetatester <birisesports@gmail.com>
pkgname=hydra-ensemble-bin
_pkgname=hydra-ensemble
pkgver=0.1.0
pkgrel=2
pkgdesc="Cross-platform multi-session terminal for Claude Code"
arch=('x86_64')
url="https://hydra-ensemble.xyz"
license=('MIT')
depends=('gtk3' 'nss' 'alsa-lib' 'libxss' 'libxtst')
optdepends=('github-cli: PR Inspector feature')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip')
source=("${_pkgname}-${pkgver}.AppImage::https://github.com/javabetatester/hydra-ensemble/releases/download/v${pkgver}/Hydra.Ensemble-${pkgver}.AppImage"
        "${_pkgname}.desktop"
        "${_pkgname}.png::https://raw.githubusercontent.com/javabetatester/hydra-ensemble/v${pkgver}/resources/icon.png")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')
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
