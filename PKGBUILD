# Maintainer: John-Michael Mulesa <jmulesa at gmail dot com>

pkgname=trine3-gog
_pkgname=trine3
pkgver=2.2.0.4
pkgrel=2
pkgdesc="GOG version of Trine 3 The Artifacts of Power"
arch=("i686" "x86_64")
url="https://www.gog.com/game/trine_3_the_artifacts_of_power"
license=("custom")
groups=("games")
source=("gog_trine_3_the_artifacts_of_power_${pkgver}.sh::gogdownloader://trine_3_the_artifacts_of_power/en3installer4" "${_pkgname}.sh" "${_pkgname}.desktop")
depends=('xorg-xwininfo' 'desktop-file-utils' 'glu' 'libxxf86vm' 'openal'
         'libdrm' 'libpng12' 'libogg' 'libvorbis' 'freetype2' 'libx11')
sha256sums=('81e20187a3987d10b4472cfcdb0e14e2ff702b63ff2314597d894759dfe50968'
            '79b2e3a5a2837e0ac17a723e3204569279d068aee8eaac7d11805ddf9449302d'
            '9dc19a7b3f53637872b94588bcfb9b31c581d0a851b76dd9ddcd1b82610e3f69')

# If you want to use lgogdownloader add the following to /etc/makepkg.conf
# DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')
DLAGENTS+=("gogdownloader::/usr/bin/echo Could not find gog installer file (%u). Manually download it to \"$(pwd)\", or set up a gogdownloader:// DLAGENT in /etc/makepkg.conf. See PKGBUILD for example.")

package() {
  # game files
  mkdir -p "${pkgdir}/opt/${_pkgname}"
  cp -r "${srcdir}/data/noarch/"* "${pkgdir}/opt/${_pkgname}/"

  # launcher
  chmod 755 "${pkgdir}/opt/${_pkgname}/start.sh"
  install -Dm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"

  # desktop environment integration
  install -Dm644 \
    "${srcdir}/data/noarch/support/icon.png" \
    "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
  install -Dm644 \
    "${srcdir}/${_pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  # license
  install -Dm644 \
    "${srcdir}/data/noarch/docs/End User License Agreement.txt" \
    "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
