# Maintainer: Dino Hensen <dino.hensen@gmail.com>
# Maintainer: Grzegorz Kozub <grzegorz.kozub@gmail.com>

# Contributor: Dino Hensen <dino.hensen@gmail.com>
# Contributor: Grzegorz Kozub <grzegorz.kozub@gmail.com>
# Contributor: tee < teeaur at duck dot com >
# Contributor: Jonathan Basniak <jon@bluedreamers.com>

pkgname=nosql-workbench
pkgver=3.20.2
pkgrel=1
pkgdesc="NoSQL Workbench for Amazon DynamoDB"
arch=(x86_64)
url="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/workbench.html"
license=('custom:NoSQL Workbench Local License Agreement ')
options=(!strip)
source_x86_64=("${pkgname}-${pkgver}.AppImage::https://dy9cqqaswpltd.cloudfront.net/NoSQL%20Workbench-linux-${pkgver}.AppImage"
"LICENSE::https://aws.amazon.com/nosql/nosql-workbench-license/"
"nosql-workbench.png"
)
sha256sums_x86_64=('3bad89b151c9e4e13a1cbb773e0f5756b7778f57a86373be6e3aaba28c0610e1'
                   'SKIP'
                   'SKIP')
# https://docs.appimage.org/user-guide/troubleshooting/fuse.html#setting-up-fuse-on-arch-linux
depends=('fuse2')
makedepends=('gendesk')

prepare() {
    gendesk -f --name "NoSQL Workbench" --pkgname "$pkgname" --exec="nosql-workbench --ozone-platform-hint=auto" --categories "Development" --pkgdesc "$pkgdesc" --icon=$pkgname
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
