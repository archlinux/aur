# Maintainer: LightDot <lightdot -a-t- g m a i l >
pkgname=wordtsar
_pkgname=WordTsar
pkgver=0.3.281
pkgrel=1
pkgdesc='A WordStar 7.0D Document mode clone with CLI and GUI. It loads WordStar 4, WordStar 7, DOCX and RTF files, and saves in WordStar 7 and RTF format.'
arch=('x86_64')
url='http://wordtsar.ca/'
license=('AGPL3')
depends=('qt5-base')
source=("https://downloads.sourceforge.net/${pkgname}/${_pkgname}-${pkgver}-src.zip")
sha256sums=('db8e533bf03588feec0011da341f57c91ce066f380c2553bdee472c0c3b6b450')

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
}
