# Maintainer: Simon Kohlmeyer <simon.kohlmeyer@skohlmeyer.de>
#
_npmname=standard
pkgname=nodejs-$_npmname
pkgver=11.0.1
pkgrel=1
pkgdesc="JavaScript style guide, linter, and formatter"
arch=('any')
url="https://standardjs.com"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
_source_file=$_npmname-$pkgver.tgz
source=("https://registry.npmjs.org/$_npmname/-/$_source_file")
sha512sums=('9eed2301c1e249cf07fa02425de8b388c559343622f0cbaaad824ac538233f8c4a5d930a9b7d756e8a902330eb608fe4b68b25b71b7609b0e3610b3d00d0bc20')

package() {
    export npm_config_cache="$srcdir/npm_cache"
    npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$_source_file

    mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
    ln -s "/usr/lib/node_modules/$_npmname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"

    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/npm/issues/9359 for details.
    find "${pkgdir}"/usr -type d -exec chmod 755 {} +
}
