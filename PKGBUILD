# Maintainer: Simon Kohlmeyer <simon.kohlmeyer@skohlmeyer.de>
#
_npmname=standard
pkgname=nodejs-$_npmname
pkgver=13.1.0
pkgrel=1
pkgdesc="JavaScript style guide, linter, and formatter"
arch=('any')
url="https://standardjs.com"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
_source_file=$_npmname-$pkgver.tgz
source=("https://registry.npmjs.org/$_npmname/-/$_source_file")
sha512sums=('87735a333b1af3cfbfc6d8d708cbdd9fa11659d96876c23f1efb6c405f841b0ac5f6454dc0d85af5390500153a6d206835f0bbf580f2200abd7a4c4e301164bb')

package() {
    export npm_config_cache="$srcdir/npm_cache"
    npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$_source_file

    mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
    ln -s "/usr/lib/node_modules/$_npmname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"

    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/npm/issues/9359 for details.
    find "${pkgdir}"/usr -type d -exec chmod 755 {} +
}
