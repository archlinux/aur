# Maintainer: Yufan You <ouuansteve at gmail>
# Contributor: Sam Whited <sam@samwhited.com>
# Contributor: j605

_npmname=triton
pkgname=nodejs-triton
pkgver=7.15.0
pkgrel=4
pkgdesc="Triton client tool and node.js library"
arch=('any')
url="https://github.com/joyent/node-triton"
license=('MPL')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('96d2f68caf6bb68187da619ccfa305f8d85126a2e5199b2830255a6b1fc9a67c')

package() {
    cd "$srcdir"
    local _npmdir="$pkgdir/usr/lib/node_modules/"
    mkdir -p "$_npmdir"
    cd "$_npmdir"
    npm install -g --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"

    # Remove the files that contain references to $pkgdir
    rm "$pkgdir/usr/lib/node_modules/$_npmname/node_modules/dtrace-provider/build/Makefile"
    rm "$pkgdir/usr/lib/node_modules/$_npmname/node_modules/dtrace-provider/build/config.gypi"

    chown -R root:root "${pkgdir}"
}
