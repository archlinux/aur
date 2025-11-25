# Maintainer: Race Dorsey <git-noreply@mail.racedorsey.com>

pkgname=chartdb
pkgver=1.18.1
pkgrel=1
pkgdesc="Database diagrams editor to visualize and design a DB with a single query"
arch=('any')
url="https://github.com/chartdb/chartdb"
license=('AGPL-3.0-or-later')
depends=()
makedepends=('npm' 'git')
optdepends=('nginx: for serving the application')
install=chartdb.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/chartdb/chartdb/archive/refs/tags/v$pkgver.tar.gz"
        "chartdb.conf.example")
sha256sums=('e016f2af34b99daa950ed3014bc64b6b5d0a2168151e6dae6042b0aed2910331'
            '01d4b1e700bbd87d5ca5a78809e0f2211dbcc4bd1e573e4835b6a3bd7da3c886')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    npm ci --cache "${srcdir}/npm-cache"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    npm run build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -dm755 "$pkgdir/usr/share/webapps/$pkgname"
    cp -r dist/* "$pkgdir/usr/share/webapps/$pkgname/"
    install -Dm644 "$srcdir/chartdb.conf.example" "$pkgdir/usr/share/doc/$pkgname/nginx.conf.example"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
