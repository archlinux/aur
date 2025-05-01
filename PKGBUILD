# Maintainer: Dino Hensen <dino.hensen@gmail.com>
# Maintainer: Grzegorz Kozub <grzegorz.kozub@gmail.com>

# Contributor: Dino Hensen <dino.hensen@gmail.com>
# Contributor: Grzegorz Kozub <grzegorz.kozub@gmail.com>
# Contributor: tee < teeaur at duck dot com >

pkgname=nosql-workbench
pkgver=3.13.5
pkgrel=1
pkgdesc="NoSQL Workbench for Amazon DynamoDB"
arch=(x86_64)
url="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/workbench.html"
license=('custom:NoSQL Workbench Local License Agreement ')
options=(!strip)
source_x86_64=("${pkgname}-${pkgver}.AppImage::https://dy9cqqaswpltd.cloudfront.net/NoSQL_Workbench.AppImage"
"LICENSE::https://aws.amazon.com/nosql/nosql-workbench-license/"
"nosql-workbench.png"
)
sha512sums_x86_64=('e309cdf2128e774a8bebf9dce8c8b86dd0b665e18657486de55dc33a1db5fcab26bff84d64d302298cb0ea62af9df5d4ed6d2995e715f80505d698625acc967b'
                   'SKIP'
                   'SKIP')
# https://docs.appimage.org/user-guide/troubleshooting/fuse.html#setting-up-fuse-on-arch-linux
depends=('fuse2')
makedepends=('gendesk')

prepare() {
    gendesk -f --name "NoSQL Workbench" --pkgname "$pkgname" --pkgdesc "$pkgdesc" --icon=$pkgname
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
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
