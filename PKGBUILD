# Maintainer: Antti <antti@antti.codes>

pkgname=lmath-bin
_pkgname=${pkgname%-bin}
pkgver=r1.9
pkgrel=3
pkgdesc="Proprietary LaTeX based math editor"
arch=('x86_64')
url="https://lehtodigital.fi/lmath/"
license=('custom')
provides=($_pkgname)
conflicts=($_pkgname)
noextract=($_pkgname-$pkgver.tar.gz)
source=($_pkgname-$pkgver.tar.gz::https://github.com/lehtoroni/lmath-issues/releases/download/$pkgver/LMath_Linux_unpacked_$pkgver.tar.gz
        $_pkgname-file.xml
        $_pkgname.desktop
        $_pkgname-bin.sh)
sha256sums=('6539a6decb0c66b9b1560dd57b9f8e545bc0b74caf4b5d654af1edaaf39d5d44'
            'fd3208d97f89ac14b5c10769014ceab10f157fd360a10ad520d714574c41472a'
            'b9c6dfa903e42dfbe065d1222f73cc930ea853e5a42a5c8645ca5f74451b43cc'
            'db12617023cbf996edb2e4d772bd8939a3e1e752ef1435e6c05156d952419f9f')
options=('!strip')

package() {
    mkdir "${srcdir}/app"
    tar xzf $_pkgname-$pkgver.tar.gz -C "${srcdir}/app"

    install -d "${pkgdir}/usr/share/licenses/${_pkgname}"
    install -d "${pkgdir}/opt/${_pkgname}"
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/share/applications"
    install -d "${pkgdir}/usr/share/icons"
    install -d "${pkgdir}/usr/share/mime/packages"

    install -m644 "${srcdir}/app/resources/app/lisenssi.rtf" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.rtf"
    install -m644 "${srcdir}/app/resources/app/static/assets/icon.png" "${pkgdir}/usr/share/icons/${_pkgname}.png"
    install -m644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -m644 "${srcdir}/${_pkgname}-file.xml" "${pkgdir}/usr/share/mime/packages/${_pkgname}-file.xml"

    cp -r "${srcdir}/app/"* "${pkgdir}/opt/${_pkgname}" -R

    install -m755 "${srcdir}/${_pkgname}-bin.sh" "${pkgdir}/usr/bin/${_pkgname}"
}

