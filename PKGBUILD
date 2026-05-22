# Maintainer: Giorgio Gilestro <giorgio@gilest.ro>
# Co-Maintainer: lapsus <yakov.till@gmail.com>
pkgname=ccusage
pkgver=20.0.3
pkgrel=1
pkgdesc="A CLI tool for analyzing Claude Code token usage and costs from local JSONL files"
arch=('any')
url="https://github.com/ryoppippi/ccusage"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
options=('!debug')
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
sha256sums=('444961e0bed784260700fef574d4bd77f26737e19be680255856a9298f961123')

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
