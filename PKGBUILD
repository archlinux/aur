# Maintainer: Dino Hensen <dino.hensen@gmail.com>

pkgname=nosql-workbench
pkgver=3.2.1
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
sha512sums_x86_64=('66e94acf05879b705268f28baf0652daa3311aebdec04f1f5b9dd1103eb131845c58bccc86eac53993af60613797bc4534f3452d672a3d008afaad7ac37ce4fd'
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
