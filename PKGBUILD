# Maintainer: Georg Nagel <g.schlmm at gmail dot com>
# Contributor: Leonardo Eugênio <lelgenio@disroot.org>
pkgname=blade-formatter
pkgver=1.41.1
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
sha256sums=('62aa42cb6414718e6847d327eef6fb35d26993c42fb1baf6a56f05b99c2a6eec')

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

