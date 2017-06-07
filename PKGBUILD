# Maintainer: Dan Beste <dan.ray.beste@gmail.com>
# Contributor: Ainola

# Notes:
#   + gog:// DLAGENT:
#       - A gog:// DLAGENT can be configured in /etc/makepkg.conf to
#         automatically pull game files from GOG.
#       - https://github.com/Sude-/lgogdownloader

pkgname='gog-dont-starve'
pkgver=2.6.0.8
pkgrel=1
pkgdesc="An uncompromising wilderness survival game full of science and magic"
url='https://www.kleientertainment.com/games/dont-starve'
license=('custom')
arch=('x86_64')
optdepends=(
    'gog-dont-starve-rog: Reign of Giants DLC'
    'gog-dont-starve-shipwrecked: Shipwrecked DLC'
)
source=(
    "${pkgname}"
    "${pkgname}.desktop"
    "file://gog_don_t_starve_${pkgver}.sh"
)
sha256sums=(
    '9827bed58903e8a351b4f52f4728b37c6e7b31abb206f2fff99e1467ae967179'
    '609856aae2d19877f8afb764a8db15a8932e535b719cc342f4b42c3d0e4b1956'
    '6cb3f1572f7b1d25d7b561cab7b144b3ad8ade0b84a9b5dbcfdaf42ede5cc28d'
)

package(){
    cd "${srcdir}"

    install -d "${pkgdir}/opt/${pkgname}/"
    install -d "${pkgdir}/opt/${pkgname}/support/"
    install -d "${pkgdir}/usr/bin/"

    cp -r data/noarch/game/ "${pkgdir}/opt/${pkgname}/"

    install -D -m 755           \
        "${srcdir}/${pkgname}"  \
        "${pkgdir}/usr/bin/${pkgname}"
    install -D -m 755           \
        data/noarch/start.sh    \
        "${pkgdir}/opt/${pkgname}/"
    install -D -m 755                       \
        data/noarch/support/*.{sh,shlib} -t \
        "${pkgdir}/opt/${pkgname}/support/"
    install -D -m 644                                       \
        'data/noarch/docs/End User License Agreement.txt'   \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m 644                   \
        "data/noarch/support/icon.png"  \
        "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -D -m 644                   \
        "${srcdir}/${pkgname}.desktop"  \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
