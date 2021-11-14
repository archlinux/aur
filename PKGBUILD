# Maintainer: sukanka <su975853527 at gmail dot com>

pkgname=siyuan-note-bin
_pkgname=siyuan-note
pkgver=1.5.2
pkgrel=1
pkgdesc="A local-first personal knowledge management system"
arch=('x86_64')
url="https://b3log.org/siyuan/"
license=('unknown')
depends=(electron)
provides=($_pkgname)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/siyuan-note/siyuan/releases/download/v${pkgver}/siyuan-${pkgver}-linux.tar.gz"
"$_pkgname.sh"
"$_pkgname.desktop"
)
sha512sums=('59f6b468d614d8b3bf8961d662521590e4ee19dc1d44c7ab8c5cc60b50df4d980cfe23453d7a509e57df0f86bab13f59c7375595bf3acee6e7986236770da16e'
            '4f8f503e770c96cd376db79e4691823b5e801bc8e8c62b8da46dc743786982c978f39b07761830578806ce8aba823491f35463d14746fcd1dc3c6466b9b2901e'
            '633efb81231d444a0e5717d94720fa03dcfffc497fde33f554e028c315b7be131264e70ea83b9c4dae1abeaa7ca4a761aabc650f0dfb2ccfbe2737e9aec4d309')

prepare(){
    cd $srcdir/siyuan-${pkgver}-linux
    rm resources/pandoc.zip
}
package() {
    cd $srcdir 
    install -Dm755 ${_pkgname}.sh  ${pkgdir}/usr/bin/${_pkgname}
    install -Dm644 ${_pkgname}.desktop -t ${pkgdir}/usr/share/applications
    
    cd $srcdir/siyuan-${pkgver}-linux
    install -Dm644 resources/stage/icon.png  ${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png
    mkdir -p ${pkgdir}/usr/lib
    mv resources ${pkgdir}/usr/lib/${_pkgname}
}
# vim: ts=2 sw=2 et:
