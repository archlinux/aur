# Maintainer: sukanka <su975853527 at gmail dot com>

pkgname=siyuan-note-bin
_pkgname=siyuan-note
pkgver=1.4.1
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
sha512sums=('55dfa9bbf5c08cd089d14a567f329396a7a6bad348f46e891dfbfe6c09405fc3f98b9b1b785e0a20f505e0ed0bb0c5f58e074edd2c810e9fcc709307b3d44729'
            '4f8f503e770c96cd376db79e4691823b5e801bc8e8c62b8da46dc743786982c978f39b07761830578806ce8aba823491f35463d14746fcd1dc3c6466b9b2901e'
            '633efb81231d444a0e5717d94720fa03dcfffc497fde33f554e028c315b7be131264e70ea83b9c4dae1abeaa7ca4a761aabc650f0dfb2ccfbe2737e9aec4d309')

prepare(){
    cd $srcdir/siyuan-${pkgver}-linux
    rm resources/pandoc.zip
    cd resources/app/electron
#     sed -i "s|\.siyuan|.config/siyuan-note|g" main.js # Confdir
    sed -i "39c const logFile = path.join(os.tmpdir(), 'siyuan-note.log')" main.js
    sed -i "19a const os = require('os');" main.js
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
