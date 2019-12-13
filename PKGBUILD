# Maintainer: Adrien Jussak <adrien.jussak@wascardev.com>

pkgname=visual-paradigm
pkgver=16.1
pkgrel=20191231
pkgdesc="UML design application (Free 30-day trial)"
arch=('x86_64')
url='https://www.visual-paradigm.com/download/'
depends=('java-environment-common')
license=('custom')
install=visual-paradigm-community.install
conflicts=('visual-paradigm-community')

# Possible values: ca1 usa10 usa11 usa13 usa14 uk3 uk5 fr1
_server=eu6

_ver=${pkgver/./_}

source=("https://$_server.visual-paradigm.com/visual-paradigm/vp$pkgver/$pkgrel/Visual_Paradigm_${_ver}_${pkgrel}_Linux64_InstallFree.tar.gz"
  'visual-paradigm-community.install'
  'visual-paradigm.desktop'
  'visual-paradigm.png'
  'x-visual-paradigm.xml')

sha256sums=('5b2a8548f77c94f91aaf2c8bb72ee6d5c7a9ab88764ab9cb92a9e4e85b2f98a0'
            'd49752a05bc69e7e5f7b23875b6ac7d7d242d761ee00030b57e9ca057babb43e'
            'fff88b05529a391dad757b380d7acf08703e11d441e04c3886e4db7f5bcd1729'
            '41517b5c2326c0ba2fe3b6647f9594f094ccf03185cf73cb87d6cf19b355ff15'
            'a3b898bc9c43cf54baa1c643c619ee172a8103cd15031d574380ca463eb1ec1c')

package() {
    mkdir -p "${pkgdir}/opt/${pkgname}"
    mkdir -p "${pkgdir}/usr/share/applications/"
    mkdir -p "${pkgdir}/usr/share/icons/hicolor/512x512/apps"
    mkdir -p "${pkgdir}/usr/bin/"
    cp -r "${srcdir}/Visual_Paradigm_${pkgver}/Application/" "${pkgdir}/opt/${pkgname}"
    cp -r "${srcdir}/Visual_Paradigm_${pkgver}/.install4j/" "${pkgdir}/opt/${pkgname}"
    cp "${srcdir}/Visual_Paradigm_${pkgver}/Visual_Paradigm" "${pkgdir}/opt/${pkgname}"
    ln -sr "${pkgdir}/opt/${pkgname}/Visual_Paradigm" "${pkgdir}/usr/bin/${pkgname}"
    cp "visual-paradigm.desktop" "${pkgdir}/usr/share/applications/visual-paradigm.desktop"
    cp "visual-paradigm.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/visual-paradigm.png"
    mkdir -p ${pkgdir}/usr/share/mime/packages
    cp "x-visual-paradigm.xml" "${pkgdir}/usr/share/mime/packages/x-visual-paradigm.xml"
}
