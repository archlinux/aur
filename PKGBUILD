# Maintainer: Giovanni 'ItachiSan' Santini <giovannisantini93@yahoo.it>

_npmname=localtunnel
pkgname=nodejs-$_npmname
pkgver=1.9.0
pkgrel=1
#epoch=
pkgdesc="Expose localhost to the world"
arch=('any')
url="https://localtunnel.me"
license=('MIT')
# Most probably
depends=('nodejs')
makedepends=('npm')
# The source code
#source=("https://github.com/$pkgname/$pkgname/archive/v$pkgver.tar.gz")
# Get the NPM registry build, as in: https://git.archlinux.org/svntogit/community.git/tree/trunk/PKGBUILD?h=packages/nodejs-emojione
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
md5sums=('f105a10bdb317663ce5f7527344f24a6')

package() {
    export npm_config_cache="$srcdir/npm_cache"
    npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$_npmname-$pkgver.tgz

    # Add the license
    mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
    ln -s "/usr/lib/node_modules/$_npmname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"

    # Fix permissions
    find "$pkgdir/usr" -type d -exec chmod 755 '{}' +
}
