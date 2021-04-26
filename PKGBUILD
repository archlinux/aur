# Maintainer: Winston Astrachan <winston dot astrachan at gmail dot com>
# Maintainer: Henry Pham <huy at tableplus dot com>

pkgname=tableplus
pkgver=0.1.82
pkgrel=1
pkgdesc='Modern, native, and friendly GUI tool for relational databases (Alpha)'
arch=('x86_64')
url='https://tableplus.com/'
license=('custom')
depends=('gtksourceview3' 'libgee' 'gnome-keyring')
source=('LICENSE'
        "https://deb.tableplus.com/debian/pool/main/t/tableplus/tableplus_${pkgver}_amd64.deb")
sha256sums=('76f924b1ebad5309ccf0dd7f3fe3d1b57ff3088b208a603900b0e240fdb5debb'
            '5b1c4a648d0f0bed440f8834f47900a6eae183eeffdfeba64a98fd205d1308a5')

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
