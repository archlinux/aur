# Maintainer: javabetatester <birisesports@gmail.com>
pkgname=hydra-ensemble-bin
_pkgname=hydra-ensemble
pkgver=0.1.2
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
source=("hydra-ensemble-0.1.2.AppImage::https://github.com/javabetatester/hydra-ensemble/releases/download/v0.1.2/Hydra.Ensemble-0.1.2.AppImage"
        "hydra-ensemble.desktop"
        "hydra-ensemble.png::https://raw.githubusercontent.com/javabetatester/hydra-ensemble/v0.1.2/resources/icon.png")
sha256sums=('8135a7668c746faf4ab21e7f7ebd76b75a649d59dd631a680fc75b6ef95144a0'
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
