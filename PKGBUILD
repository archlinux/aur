# Maintainer: Giorgio Gilestro <giorgio@gilest.ro>
# Co-Maintainer: lapsus <yakov.till@gmail.com>
pkgname=ccusage
pkgver=17.1.6
pkgrel=1
pkgdesc="A CLI tool for analyzing Claude Code token usage and costs from local JSONL files"
arch=('any')
url="https://github.com/ryoppippi/ccusage"
license=('MIT')
depends=('nodejs')
makedepends=('npm' 'curl' 'jq')
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
sha256sums=('efad648c84514aaba59cf7fc15a11771b38555f3e091e3a464a3e6ad28549c77')

pkgver() {
    curl -s "https://api.github.com/repos/ryoppippi/ccusage/releases/latest" | 
    jq -r '.tag_name' | sed 's/^v//'
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
