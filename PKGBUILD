# Maintainer: Giorgio Gilestro <giorgio@gilest.ro>
# Co-Maintainer: lapsus <yakov.till@gmail.com>
pkgname=ccusage
pkgver=20.0.0
pkgrel=1
pkgdesc="A CLI tool for analyzing Claude Code token usage and costs from local JSONL files"
arch=('any')
url="https://github.com/ryoppippi/ccusage"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
options=('!debug')
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
sha256sums=('f3561821cbd72dfb1bef5cc6d9557dceb2c712d427c4f2722ff09d3b5ded9739')

latestver() {
    curl -fsSL 'https://registry.npmjs.org/ccusage/latest' | jq -r '.version'
}

build() {
    # No build needed - using pre-built npm package
    true
}

package() {
    # Install using npm from the downloaded tarball
    npm install --cache "$srcdir/npm-cache" --prefix="$pkgdir/usr" --global "$srcdir/$pkgname-$pkgver.tgz"

    # Install license
    install -Dm644 "$pkgdir/usr/lib/node_modules/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
