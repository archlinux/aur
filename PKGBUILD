# Maintainer:
#   guillaume hayot <postblue@postblue.info>
# Contributors:
#   henning mueller <henning@orgizm.net>

pkgname=legend-of-grimrock
pkgver=2.1.0.5
pkgrel=1
pkgdesc="A 3D grid-based dungeon crawler inspired by classic 1980s and 1990s action role-playing games Dungeon Master, Eye of the Beholder and Ultima Underworld."
url="https://www.gog.com/game/legend_of_grimrock"
arch=(i686 x86_64)
license=("custom:commercial")
depends=(freeimage minizip sdl libvorbis freetype2 zlib openal libgl libx11 libogg libxext desktop-file-utils)
#optdepends=('libtxc_dxtn: For Mesa S3TC support.')
# requires aur/lgogdownloader or the game file directly next to the PKGBUILD
#DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')
source=("${pkgname}"
        "${pkgname}.desktop"
        "gog_legend_of_grimrock_${pkgver}.sh::gogdownloader://legend_of_grimrock/en3installer3")
sha256sums=('e72d4212b2394bd6038ac13ada2717756b4ce4a9370bbe96501ab1c489410861'
            'b93a443998d1fbe415c7228c7d173ea0226dabd028badbe0ce8f6f13a93de819'
            'c5fa1064977e4df4389d45be12a655f151227d08a22f3058bc4bc6e9627d1af1')
# Disable compression of the package
PKGEXT='.pkg.tar'

package() {
    install -d "${pkgdir}/opt/${pkgname}/"
    install -d "${pkgdir}/opt/${pkgname}/support/"
    install -d "${pkgdir}/usr/bin/"
    install -d "${pkgdir}/usr/share/applications/"
    install -d "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -d "${pkgdir}/usr/share/pixmaps/"

    cp -r data/noarch/game/ "${pkgdir}/opt/${pkgname}/"
    find "${pkgdir}/opt/${pkgname}" -type d -exec chmod 755 {} \;

    install -m 755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -m 755 data/noarch/start.sh "${pkgdir}/opt/${pkgname}/"
    install -m 755 data/noarch/gameinfo "${pkgdir}/opt/${pkgname}/"
    install -m 755 data/noarch/support/*.{sh,shlib} -t "${pkgdir}/opt/${pkgname}/support/"
    install -m 644 'data/noarch/docs/End User License Agreement.txt' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -m 644 "data/noarch/game/grimrock.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -m 644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
