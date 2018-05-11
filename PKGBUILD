_npmscope=@angular
_npmname=cli
_npmver=6.0.1
pkgname=angular-cli # All lowercase
pkgver=6.0.1
pkgrel=2
pkgdesc="CLI tool for Angular"
arch=(any)
url="https://github.com/angular/angular-cli"
license=()
depends=('nodejs' 'npm' )
optdepends=()
options=(!strip)

package() {
    cd $srcdir
    local _npmdir="$pkgdir/usr/lib/node_modules/"
    mkdir -p $_npmdir
    cd $_npmdir
    npm install -g --prefix "$pkgdir/usr" $_npmscope/$_npmname@$_npmver
    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/npm/issues/9359 for details.
    find "${pkgdir}"/usr -type d -exec chmod 755 {} +
}

# vim:set ts=2 sw=2 et:
