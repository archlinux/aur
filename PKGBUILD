# Maintainer: John-Michael Mulesa <jmulesa at gmail dot com>

pkgname=torchlight2-gog
pkgver=1.25.9.7
pkgrel=1
pkgdesc="GOG version of Torchlight 2"
arch=("i686" "x86_64")
url="http://www.gog.com/game/torchlight_ii"
license=("custom")
groups=("games")
source=("gog_torchlight_2_2.0.0.2.sh::gogdownloader://torchlight_ii/en3installer2" "torchlight2-gog" "torchlight2-gog.desktop")
sha256sums=('ae50c7f6d423f59242cb7d6bf0b525880e94061a554fc3c37561db7a5568c998'
            'a0df2d18749b3cc37d6fc659f84c1e5bbabe16f1698f0d4ee9a557284fc9e37e'
            '00bb69d20618fd9ba0466b49d0c3e6208a65e745acf8ae8e0f66efad7adb65a6')
depends=(libgl libx11 libxext desktop-file-utils)

# If you want to use lgogdownloader add the following to /etc/makepkg.conf
# DLAGENTS+=('goggogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')
DLAGENTS+=("gogdownloader::/usr/bin/echo Could not find gog installer file (%u). Manually download it to \"$(pwd)\", or set up a gogdownloader:// DLAGENT in /etc/makepkg.conf. See PKGBUILD for example.")

package() {
  # game files
  mkdir -p "${pkgdir}/opt/${pkgname}"
  cp -r "${srcdir}/data/noarch/"* "${pkgdir}/opt/${pkgname}/"

  # launcher
  chmod 755 "${pkgdir}/opt/${pkgname}/start.sh"
  install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  # desktop environment integration
  install -Dm644 \
    "${srcdir}/data/noarch/support/icon.png" \
    "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 \
    "${srcdir}/${pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # license
  install -Dm644 \
    "${srcdir}/data/noarch/docs/End User License Agreement.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
