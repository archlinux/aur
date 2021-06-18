# Maintainer: Dino Hensen <dino.hensen@gmail.com>

pkgname=nosql-workbench
pkgver=3.0.0
pkgrel=2
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
sha512sums_x86_64=('46b73476204932ac8197ad63d7f0fe860ca2e95d3c5217414f8dcba77fa50961b86d3f0b8b0e11979184cbfde6dc63495696d1d2dd9d3b58ca08bb37fc451df7'
'SKIP'
'SKIP'
)
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
