# Maintainer: Dan Beste <dan.ray.beste@gmail.com>
# Contributor: Ainola

# Notes:
#   + gog:// DLAGENT:
#       - A gog:// DLAGENT can be configured in /etc/makepkg.conf to
#         automatically pull game files from GOG.
#       - https://github.com/Sude-/lgogdownloader

pkgname='gog-undertale'
pkgver=2.0.0.1
pkgrel=1
pkgdesc="UNDERTALE! The RPG game where you don't have to destroy anyone."
url='http://undertale.com/'
license=('custom')
groups=('games' 'gog')
arch=('i686' 'x86_64')
depends_i686=('glu' 'libxrandr' 'openal' 'openssl')
depends_x86_64=('lib32-glu' 'lib32-libxrandr' 'lib32-openal' 'lib32-openssl')
source=(
    "${pkgname}"
    "${pkgname}.desktop"
    "file://${pkgname//-/_}_${pkgver}.sh"
)
sha256sums=(
    'c4053af037e1a80c692a7caf2519a98efd2390ed40fc42810143c016dec12116'
    'df3e93c98a0f0f9fd99d57284aadae0d313d64584384dcba68b880374cbe9476'
    'dd47d4418c7c3b1b971123d2364f988f29ca78b8a7687742e8937e9ffc3bc297'
)

package() { 
    cd "${srcdir}"
    
    install -d "${pkgdir}/opt/${pkgname}/"
    install -d "${pkgdir}/opt/${pkgname}/support/"
    install -d "${pkgdir}/usr/bin/"

    cp -r data/noarch/game/ "${pkgdir}/opt/${pkgname}/"
    find "${pkgdir}/opt/${pkgname}" -type d -exec chmod 755 {} \;

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
