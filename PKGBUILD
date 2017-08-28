# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor:

pkgname=gog-thimbleweedpark
pkgver=1.0.938.14433
pkgrel=1
epoch=1
pkgdesc='Thimbleweed Park'
arch=('x86_64')
url='https://www.gog.com/game/thimbleweed_park'
license=('custom')
options=('libtool' 'staticlibs' '!strip')
source=(
    "local://thimbleweed_park_en_${pkgver//./_}.sh"
    'thimbleweedpark.shim'
)
sha512sums=(
    '2db274b477307efaecd4bbc2e1916fb833b12b9f3615cce217dea3aa4995576dd1fdd26ea012f2ff12f959743b1176e04fa5d1508699f0f42bd53a97f5119125'
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

    msg2 "Note that this version (${pkgver}) supersedes any 2.x release."
}
