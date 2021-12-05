# Maintainer: sukanka <su975853527 at gmail dot com>

pkgname=siyuan-note-bin
_pkgname=siyuan-note
pkgver=1.5.4
pkgrel=2
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
sha512sums=('bbe022e8e13c29d387de171dcb98f01dd575e1834efa87581cf85a5e07345fb62d10157aa05dfbc1abf1d3f177d9a814671518f8c5fa1e15dc5401893c87af5c'
            '4f8f503e770c96cd376db79e4691823b5e801bc8e8c62b8da46dc743786982c978f39b07761830578806ce8aba823491f35463d14746fcd1dc3c6466b9b2901e'
            'a7033de6c06d47ba5b5392d1e51de07d46b3d09944dd74b94280a2f35c4b1a68bf25665e8fb60517039366071b2cc63dadf1d54eb90b53c020aad6f19b8b35fc')

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
