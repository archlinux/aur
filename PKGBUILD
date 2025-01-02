# Maintainer: Georg Nagel <g.schlmm at gmail dot com>
# Contributor: Leonardo Eugênio <lelgenio@disroot.org>
pkgname=blade-formatter
pkgver=1.42.0
pkgrel=1
pkgdesc="An opinionated blade template formatter for Laravel that respects readability"
arch=(any)
url="https://github.com/shufo/blade-formatter"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
optdepends=()
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)
sha256sums=('c6ec55764d14217bf13c3b831da2b8eefc760e5b972c09130d41587c671f1d40')

package() {
    local _npmdir="$pkgdir/usr/lib/node_modules/"
    mkdir -p "$_npmdir"
    cd "$_npmdir"
    npm install -g --prefix "$pkgdir/usr" "$pkgname@$pkgver"

    # npm gives ownership of ALL FILES to build user
    chown -R root:root "$pkgdir"

    # Add license
    install -Dm644 "$pkgdir/usr/lib/node_modules/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

