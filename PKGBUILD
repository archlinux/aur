# Maintainer: Dan Beste <dan.ray.beste@gmail.com>
# Thanks to: Ainola for the base PKGBUILD (gog-undertale)

# All dependencies are included with the gog_dragonsphere_$version.sh archive.

pkgname=gog-dragonsphere
pkgver=2.0.0.2
pkgrel=1
pkgdesc="Owned King Of Callahach! It's been twenty years since your father saved the world by entrapping the evil Sorcerer Sanwe. Now the spell is waning. Sanwe's malevolent force will soon consume the land, and only you can stop him."
url="https://www.gog.com/game/dragonsphere"
license=(
    'custom'
)
arch=(
    'i686'
    'x86_64'
)
optdepends=(
    'firejail: Automatically sandbox this application from your OS'
)
source=(
    "gog://${pkgname//-/_}_${pkgver}.sh"
    "${pkgname}.desktop"
    "${pkgname}"
)
sha256sums=(
    'be0f2536655bf444c31c78767de171103d9b87ad9078b2fbb370416b1f7979ab'
    '765684a1ab55c678f3dce487330a84954b290e6f5b8894d712d24bdb810409b0'
    'd18a17f83d1efcf85bcbf479081bccb0433f9891e8822d9ef90e606a0dfb0d20'
)
DLAGENTS=(
    "gog::/usr/bin/echo %u Download the GOG file to $PWD or set up a gog:// DLAGENT."
)
groups=(
    'games'
    'gog'
)

package(){
    cd "${srcdir}"

    # Install game
    install -d "${pkgdir}/opt/${pkgname}/"
    install -d "${pkgdir}/opt/${pkgname}/support"
    install -d "${pkgdir}/usr/bin/"
    cp -r "data/noarch" "${pkgdir}/opt/${pkgname}/"
    

    find "${pkgdir}/opt/${pkgname}" -type d -exec chmod 755 {} \;
    install -Dm755 "data/noarch/start.sh"               \
        "${pkgdir}/opt/${pkgname}/"
    install -Dm755 data/noarch/support/*.{sh,shlib} -t  \
        "${pkgdir}/opt/${pkgname}/support"

    # Desktop integration
    install -Dm 644 "data/noarch/support/icon.png" \
        "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "data/noarch/docs/End User License Agreement.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm 644 "${srcdir}/${pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm755 "${srcdir}/${pkgname}" \
        "${pkgdir}/usr/bin/${pkgname}"
}
