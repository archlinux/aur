# Maintainer: LightDot <lightdot -a-t- g m a i l >
pkgname=wordtsar
_pkgname=WordTsar
pkgver=0.3.719
pkgrel=1
pkgdesc='A WordStar 7.0D Document mode clone. It loads WordStar 4, WordStar 7, DOCX and RTF files, and saves in WordStar 7 and RTF format.'
arch=('x86_64')
url='http://wordtsar.ca/'
license=('AGPL3')
depends=('qt5-base')
source=("https://downloads.sourceforge.net/${pkgname}/${_pkgname}-${pkgver}-src.zip"
        "${pkgname}.png"
        "${pkgname}.desktop")
sha256sums=(
        'b42e134b209a8a2f94f07d69b1a5f302c9620435dc14d654a3c245904c0f9178'
        '685d526fab45098fd92d5c34a0cf75fdc83df5836432b75966934e37b13a5bb9'
        '6f46f301fd26284298f150a3187ac9d7b49270a6e45cbcdc23702318ea74e772')

prepare() {
    cd "${_pkgname}-${pkgver}-src"
    sed -i 's!\.\./!!g' ${pkgname}.pro
}

build() {
    cd "${_pkgname}-${pkgver}-src"
    qmake-qt5 ${pkgname}.pro
    make
}

package() {
    cd "${_pkgname}-${pkgver}-src"
    install -D -m755 ${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
    install -D -m644 LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
    install -D -m644 ../${pkgname}.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png
    install -D -m644 ../${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
}
