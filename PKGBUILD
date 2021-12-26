# Maintainer: Winston Astrachan <winston dot astrachan at gmail dot com>
# Maintainer: Henry Pham <huy at tableplus dot com>

pkgname=tableplus
pkgver=0.1.178
pkgrel=1
pkgdesc='Modern, native, and friendly GUI tool for relational databases (Alpha)'
arch=('x86_64')
url='https://tableplus.com/'
license=('custom')
depends=('gtksourceview3' 'libgee' 'gnome-keyring')
source=('LICENSE'
        "https://deb.tableplus.com/debian/pool/main/t/tableplus/tableplus_${pkgver}_amd64.deb")
sha256sums=('76f924b1ebad5309ccf0dd7f3fe3d1b57ff3088b208a603900b0e240fdb5debb'
            '700e3b01fb87c6f9563da38bf0a8ed473f5176eb6abc6ed70d10ed1f3d05fb7f')

prepare() {
    tar -xf "${srcdir}/data.tar.xz"
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
