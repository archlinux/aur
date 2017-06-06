# Maintainer: Dan Beste <dan.ray.beste@gmail.com>

# Notes:
#   + gog:// DLAGENT:
#       - A gog:// DLAGENT can be configured in /etc/makepkg.conf to
#         automatically pull game files from GOG.
#       - https://github.com/Sude-/lgogdownloader

pkgname='gog-besiege'
pkgver=2.2.0.3
pkgrel=1
pkgdesc='Besiege is an upcoming physics based building game in which you construct 
medieval siege engines and lay waste to immense fortresses and peaceful hamlets.'
url='http://spiderlinggames.co.uk/'
license=('custom')
groups=('games' 'gog')
arch=('i686' 'x86_64')
source=(
    "${pkgname}"
    "${pkgname}.desktop"
    "file://${pkgname//-/_}_${pkgver}.sh"
)
sha256sums=(
    '161227eeb3e2d63da8fc124f9893e00ee5a45e24cd9b9d3cd3dbeb18b4ad2bb1'
    'f02edff7f3174e5f4239fc2fa2c669b47ee8608eb8e4a817ea708e981056a3ae'
    'd1e0e3153e20ff499bb078374f0b863629414e987f22f44ae16366e7ffa8137e'
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
