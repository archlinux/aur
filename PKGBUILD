# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: Sabart Otto <seberm at gmail dot com>

pkgname=adminer
pkgver=4.7.7
pkgrel=3
pkgdesc="A full-featured MySQL management tool written in PHP."
arch=('any')
license=('Apache' 'GPL')
depends=('php')
optdepends=('mysql' 'apache' 'postgresql' 'sqlite')
url="https://www.adminer.org"
install=${pkgname}.install
source=("${pkgname}.install"
        "httpd-${pkgname}.conf"
        "https://github.com/vrana/adminer/releases/download/v${pkgver}/adminer-${pkgver}.php")
sha256sums=('a9b786e220c0deabcb96849ffa511f1ef0b130836f978a8504e1ffbc9c723e51'
            '176b392620e8d972188685e0e202cba853a2ff5e3d0c90fef130ef1c8c2491c2'
            '566152a2d86186dcfb28856b4ed0dfdb60e355d93ab693f7931201f75868fff0')

package() {
    cd "$srcdir"
    install -Dm0644 "${pkgname}-${pkgver}.php" \
        "$pkgdir/usr/share/webapps/$pkgname/index.php"

    # TODO: I don't really like this. What if someone is using nginx, for
    # example? Or doesn't care to have any configuration installed at all.
    # Consider removing.
    install -Dm0644 "httpd-${pkgname}.conf" \
        "$pkgdir/etc/httpd/conf/extra/httpd-${pkgname}.conf"
}
