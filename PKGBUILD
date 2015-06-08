# Maintainer: Alessandro Pazzaglia <jackdroido at gmail dot com>

pkgname=assol
pkgver=1.1
pkgrel=2
pkgdesc="A Slower Speed of Light: a special relativity's effects simulation"
arch=('i686' 'x86_64')
url="http://gamelab.mit.edu/games/a-slower-speed-of-light/"
license=('custom')
depends=('glu' 'libxext' 'libxcursor')
source=(
    "http://web.mit.edu/gambit/summer12/speedoflight/beta/A_Slower_Speed_of_Light.tgz"
    "LICENSE"
)
md5sums=(
    'b325de8b3432af9f2ac0e5e46305cef2'
    '8ac9a8bbef7f4b0b40425e0e8f14eaef'
)
options=('!strip')

_xtardir="A Slower Speed of Light"

package() {
    cd "${srcdir}/${_xtardir}"

    install -d -m 755 "${pkgdir}/usr/bin"
    install -d -m 755 "${pkgdir}/usr/share/${pkgname}"
    install -d -m 755 "${pkgdir}/usr/share/licenses/${pkgname}"

    cp -a "${_xtardir}_Data" "${pkgdir}/usr/share/${pkgname}/"

    if   [ "${CARCH}" ==  'i686'  ]; then
        install -m 755 "${_xtardir}.x86" "${pkgdir}/usr/share/${pkgname}/"
        ln -s "/usr/share/${pkgname}/${_xtardir}.x86" "${pkgdir}/usr/bin/assol"
        rm -rf "${pkgdir}/usr/share/${pkgname}/${_xtardir}_Data/Mono/x86_64/"
    elif [ "${CARCH}" == 'x86_64' ]; then
        install -m 755 "${_xtardir}.x86_64" "${pkgdir}/usr/share/${pkgname}/"
        ln -s "/usr/share/${pkgname}/${_xtardir}.x86_64" "${pkgdir}/usr/bin/assol"
        rm -rf "${pkgdir}/usr/share/${pkgname}/${_xtardir}_Data/Mono/x86/"
    else
        return 1
    fi

    install -m 644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
}
