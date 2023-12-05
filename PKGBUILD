# Maintainer: Dino Hensen <dino.hensen@gmail.com>
# Maintainer: Grzegorz Kozub <grzegorz.kozub@gmail.com>

# Contributor: Dino Hensen <dino.hensen@gmail.com>
# Contributor: Grzegorz Kozub <grzegorz.kozub@gmail.com>

pkgname=nosql-workbench
pkgver=3.9.0
pkgrel=1
pkgdesc="NoSQL Workbench for Amazon DynamoDB"
arch=('x86_64')
url="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/workbench.html"
license=('custom:NoSQL Workbench Local License Agreement ')
options=(!strip)
source_x86_64=("${pkgname}-${pkgver}.AppImage::https://www.dropbox.com/scl/fi/8b0g1m1zt26al1n8d9fg4/NoSQL-Workbench-linux-x86_64-${pkgver}.AppImage?rlkey=lkzid7ja1a7rkristxhu5z6ta&dl=1"
"LICENSE::https://aws.amazon.com/nosql/nosql-workbench-license/"
"nosql-workbench.png"
)
noextract=("${pkgname}-${pkgver}.AppImage")
sha512sums_x86_64=('47c1891d7cd66de34a1ef07d0baa11a2dd19e3a42e4fb3e1b6278775138c6b378fe012b83a7f98f1a32cdfb51ea139e032e82546333adc3aef3cbc85a36ccd7e'
'SKIP'
'SKIP'
)
# https://docs.appimage.org/user-guide/troubleshooting/fuse.html#setting-up-fuse-on-arch-linux
depends=('fuse')
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

