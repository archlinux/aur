# Maintainer: Winston Astrachan <winston dot astrachan at gmail dot com>
# Maintainer: Henry Pham <huy at tableplus dot com>

pkgname=tableplus
pkgver=0.1.182
pkgrel=1
pkgdesc='Modern, native, and friendly GUI tool for relational databases (Alpha)'
arch=('x86_64')
url='https://tableplus.com/'
license=('custom')
depends=('gtksourceview3' 'libgee'  'gnome-keyring')
source=('LICENSE'
        "tableplus_${pkgver}_${pkgrel}_amd64.deb::https://deb.tableplus.com/debian/21/pool/main/t/tableplus/tableplus_${pkgver}_amd64.deb")
sha256sums=('76f924b1ebad5309ccf0dd7f3fe3d1b57ff3088b208a603900b0e240fdb5debb'
            '739c999c4f7192c949769017b7f8f53be965aa9c62f8ac8f73a3df1af71175c8')

prepare() {
    tar -xf "${srcdir}/data.tar.zst"
}

package() {
    cd "$srcdir"

    install -d "${pkgdir}/opt/tableplus/"
    install -Dm755 opt/tableplus/tableplus -t "$pkgdir/usr/local/bin/"
    install -Dm644 opt/tableplus/tableplus.desktop -t "${pkgdir}/usr/share/applications/"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    cp -r opt/tableplus/resource "${pkgdir}/opt/tableplus/"

    echo "" >> "${pkgdir}/usr/share/applications/tableplus.desktop"
    echo "Categories=Utility;Development;" >> "${pkgdir}/usr/share/applications/tableplus.desktop"
    echo "Comment=Modern, native, and friendly GUI tool for relational databases (Alpha)" >> "${pkgdir}/usr/share/applications/tableplus.desktop"

    find "${pkgdir}/opt/tableplus/" -type d -exec chmod 755 {} \;
    find "${pkgdir}/opt/tableplus/" -type f -exec chmod 644 {} \;
}
