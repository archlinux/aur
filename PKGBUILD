# Maintainer: sukanka <su975853527 at gmail dot com>

pkgname=siyuan-note-bin
_pkgname=siyuan-note
pkgver=1.5.6
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
"$_pkgname.patch"
)
sha512sums=('899f9e5122360aa000cf9f95187376f6ee2afe843faeeb7272f65d4ed5157e078a101ec5867ab02732a6cdc4af3f10b67e307f716b2023361f9042159c6a98a7'
            '4f8f503e770c96cd376db79e4691823b5e801bc8e8c62b8da46dc743786982c978f39b07761830578806ce8aba823491f35463d14746fcd1dc3c6466b9b2901e'
            '4ca7d777c2dce64d89a874af268773009ba0ebe064c3ce0034913c447666bf6636a3c81d1145579fe1b0b6a35195b1f97b1b4cd56b50e990fb0642c4aae281f0'
            '007b76aa7d2755663a49486954c08b18dfc18b9aa33d0daa0cbedd0402e9ee71345f89a48de59d84fef6ea24821176764296c84fc4dbf4602896181a020d9c74')

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
