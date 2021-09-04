# Maintainer: Yufan You <ouuansteve at gmail>
# Contributor: Emilien Devos (unixfox) <contact@emiliendevos.be>

_npmname=wildduck
pkgname=nodejs-wildduck
pkgver=1.35.0
pkgrel=1
pkgdesc='Opinionated email server'
arch=(any)
url=https://github.com/nodemailer/wildduck
provides=(wildduck)
conflicts=(wildduck)
license=(custom:EUPL)
depends=(nodejs)
makedepends=(npm)
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('acd9f387d2e494cfafea44bf4f3b207c2930966a0fbd2c3744eec1d309400b0c')

package() {
    cd "$srcdir"
    local _npmdir="$pkgdir/usr/lib/node_modules/"
    mkdir -p "$_npmdir"
    cd "$_npmdir"
    npm install -g --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"
    install -Dm644 "$_npmdir/$_npmname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Remove the files that contain references to $pkgdir
    rm "$pkgdir/usr/lib/node_modules/$_npmname/node_modules/dtrace-provider/build/Makefile"
    rm "$pkgdir/usr/lib/node_modules/$_npmname/node_modules/dtrace-provider/build/config.gypi"

    chown -R root:root "${pkgdir}"
}
