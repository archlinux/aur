# Maintainer: westpoint.io <https://github.com/westpoint-io>
pkgname=dustoff
pkgver=1.0.0
pkgrel=1
pkgdesc='Find and remove JS/TS build artifacts wasting disk space'
arch=(any)
url='https://github.com/westpoint-io/dustoff'
license=('MIT')
depends=('nodejs>=18.18.0')
makedepends=('npm')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('8cc42c03f1925bb44cde7b981a9f37e09a1a32a9cbf2630217479dd6342355d3')

package() {
    npm install -g --cache "${srcdir}/npm-cache" --prefix "$pkgdir/usr" \
        "$srcdir/$pkgname-$pkgver.tgz"

    # Fix npm permission bugs
    find "$pkgdir/usr" -type d -exec chmod 755 {} +
    chown -R root:root "$pkgdir"

    # Install license
    install -Dm644 "$pkgdir/usr/lib/node_modules/$pkgname/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
