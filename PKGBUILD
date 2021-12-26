# Maintainer: sukanka <su975853527 at gmail dot com>

pkgname=siyuan-note-bin
_pkgname=siyuan-note
pkgver=1.5.4
pkgrel=3
pkgdesc="A local-first personal knowledge management system"
arch=('x86_64')
url="https://b3log.org/siyuan/"
license=('unknown')
depends=(electron)
provides=($_pkgname)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/siyuan-note/siyuan/releases/download/v${pkgver}/siyuan-${pkgver}-linux.tar.gz"
"$_pkgname.sh"
"$_pkgname.desktop"
"$_pkgname.patch"
)
sha512sums=('bbe022e8e13c29d387de171dcb98f01dd575e1834efa87581cf85a5e07345fb62d10157aa05dfbc1abf1d3f177d9a814671518f8c5fa1e15dc5401893c87af5c'
            '4f8f503e770c96cd376db79e4691823b5e801bc8e8c62b8da46dc743786982c978f39b07761830578806ce8aba823491f35463d14746fcd1dc3c6466b9b2901e'
            '4ca7d777c2dce64d89a874af268773009ba0ebe064c3ce0034913c447666bf6636a3c81d1145579fe1b0b6a35195b1f97b1b4cd56b50e990fb0642c4aae281f0'
            '4328268c7724d412a17a5ce1b428b07f5b2b477345e731c965416011f5874c2cc22e8d74270601bbe9352620e79ed9b663605d08e9f9eceda4e19dd42b8c8ae5')

prepare(){
    cd $srcdir/siyuan-${pkgver}-linux
    rm resources/pandoc.zip
    cd $srcdir
    patch --forward --strip=1 --input="${srcdir}/${_pkgname}.patch"
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
