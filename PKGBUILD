# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor:

pkgname=gog-thimbleweedpark
pkgver=2.6.0.7
pkgrel=1
pkgdesc='Thimbleweed Park'
arch=('x86_64')
url='https://www.gog.com/game/thimbleweed_park'
license=('custom')
options=('libtool' 'staticlibs' '!strip')
source=(
    "local://gog_thimbleweed_park_${pkgver}.sh"
    'thimbleweedpark.shim'
)
sha512sums=(
    'c89f86efca6941068a245402c090c6014447327a3a34f97791b6e328862aef2fcf142086bf13549c670ce70e819dde045f1e06d1684cf909a88df0b74017b40a'
    'e769cb50a03620f41d864c296224e3a3c7bce93613b714590caabb8cd726ccef5f1a08a664a6018ef7fd74a836340ae6165cb0801e86424639adba3513d96d18'
)
PKGEXT=.pkg.tar
_gamename='thimbleweedpark'

package() {
    msg2 'Installing the license'
    install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
        "${srcdir}/data/noarch/docs/End User License Agreement.txt"

    msg2 'Installing game data'
    mkdir -p "${pkgdir}/opt/gog/${_gamename}"
    cp -r --preserve=mode -t "${pkgdir}/opt/gog/${_gamename}" \
        "${srcdir}/data/noarch"/*

    msg2 'Installing game icon'
    install -D -m 644 -T \
        "${srcdir}/data/noarch/support/icon.png" \
        "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

    msg2 'Installing executable shim'
    install -D -m 755 -T \
        "${srcdir}/${_gamename}.shim" \
        "${pkgdir}/usr/bin/${_gamename}"

    msg2 'Installing documentation'
    install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
        "${srcdir}/data/noarch/docs"/*
    install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}/support" \
        "${srcdir}/data/noarch/support/support_notice.txt"
}
