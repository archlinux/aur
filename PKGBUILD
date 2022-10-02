# Maintainer: Dino Hensen <dino.hensen@gmail.com>

pkgname=nosql-workbench
pkgver=3.3.0
pkgrel=1
pkgdesc="NoSQL Workbench for Amazon DynamoDB"
arch=('x86_64')
url="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/workbench.html"
license=('custom:NoSQL Workbench Local License Agreement ')
options=(!strip)
source_x86_64=("${pkgname}-${pkgver}.AppImage::https://s3.amazonaws.com/nosql-workbench/NoSQL%20Workbench-linux-x86_64-${pkgver}.AppImage"
"LICENSE::https://aws.amazon.com/nosql/nosql-workbench-license/"
"nosql-workbench.png"
)
noextract=("${pkgname}-${pkgver}.AppImage")
sha512sums_x86_64=('66668f6fd96c99c2762a44aec3b50cb638e013d97aab6196c15e38a10e85d5eac9ff64ffc014cc593183138226226bfcefe801e1a3a709a3d827f6b3b4c44259'
'SKIP'
'SKIP'
)
# https://docs.appimage.org/user-guide/troubleshooting/fuse.html#setting-up-fuse-on-arch-linux
depends=('fuse')
makedepends=('gendesk')

prepare() {
    gendesk -f --name "$pkgdesc" --pkgname "$pkgname" --pkgdesc "$pkgdesc" --icon=$pkgname
}

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}.AppImage" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/opt/${pkgname}/LICENSE"
    install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 "${srcdir}/$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"

    # Symlink executable
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${pkgname}"

    # Symlink license
    mkdir -p "${pkgdir}/usr/share/licenses/$pkgname"
    ln -s "/opt/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
