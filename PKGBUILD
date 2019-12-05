# Maintainer: Winston Astrachan <winston dot astrachan at gmail dot com>

pkgname=tableplus
pkgver=0.1_18
pkgrel=2
pkgdesc="Modern, native, and friendly GUI tool for relational databases (Alpha)"
arch=('x86_64')
url="https://tableplus.com/"
license=('custom')
depends=('gtksourceview3' 'libgee')
source=('LICENSE'
        "https://deb.tableplus.com/debian/pool/main/t/tableplus/tableplus_${pkgver//_/-}_amd64.deb"
)
sha256sums=('76f924b1ebad5309ccf0dd7f3fe3d1b57ff3088b208a603900b0e240fdb5debb'
            'd41e696b1e7265b9d9938c9241d692766719318934a16ff7080eb5f92ce1777c'
)
validpgpkeys=('2A17818B38772786')

prepare() {
    cd "$srcdir"
    tar -xf data.tar.xz
}

package() {
    cd "$srcdir"

    install -d "$pkgdir/usr/local/bin/"
    install -d "$pkgdir/usr/share/applications/"
    install -d "$pkgdir/opt/tableplus/"

    install -Dm755 opt/tableplus/tableplus "$pkgdir/usr/local/bin/"
    install -Dm644 opt/tableplus/tableplus.desktop "$pkgdir/usr/share/applications/"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    cp -r opt/tableplus/resource "$pkgdir/opt/tableplus/"
    find opt/tableplus/ -type d -exec chmod 755 {} \;
    find opt/tableplus/ -type f -exec chmod 644 {} \;
}
