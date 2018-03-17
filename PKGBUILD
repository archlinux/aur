# Maintainer: James An <james@jamesan.ca>

pkgname=nodejs-profitbricks-cli
_pkgname=${pkgname#nodejs-}
pkgver=4.1.0
pkgrel=1
pkgdesc="ProfitBricks Cross Platform Command Line tool"
arch=('any')
url="https://devops.profitbricks.com/tools/cli/"
license=('Apache')
depends=('nodejs')
makedepends=('npm')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=(!emptydirs)
source=("http://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz")
noextract=($_pkgname-$pkgver.tgz)
md5sums=('ffd80bb29cb15807f922bf31b7e8b1c9')

package() {
    npm install -g $_pkgname-$pkgver.tgz --prefix "$pkgdir/usr"
    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/npm/issues/9359 for details.
    find "$pkgdir/usr" -type d -exec chmod 755 {} +

    # Configure shell autocompletion.
    install -Dm644 "$pkgdir/usr/lib/node_modules/$_pkgname/autocomplete" "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
}
