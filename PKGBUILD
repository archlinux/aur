# Maintainer: Yufan You <ouuansteve at gmail>

_npmname=server
_npmscope=@volar
pkgname=volar-server
pkgver=0.27.12
pkgrel=1
pkgdesc='Fast Vue Language Support Extension'
arch=('any')
url='https://github.com/johnsoncodehk/volar/tree/master/packages/server'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(
    https://registry.npmjs.org/$_npmscope/$_npmname/-/$_npmname-$pkgver.tgz
    wrapper.sh
)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('aa10c9a1fc31dc2b4d858b549e45891681c7e63a6d4716d065b3245d37f50535'
            '6b516af70389d86615373c556b542e2f859f2bd627ebc52f7da37a0b69cfc3c9')

package() {
    cd "$srcdir"
    local _npmdir="$pkgdir/usr/lib/node_modules/"
    mkdir -p "$_npmdir"
    cd "$_npmdir"
    npm install -g --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"
    chown -R root:root "${pkgdir}"
    install -Dm755 "$srcdir/wrapper.sh" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "$_npmdir/$_npmscope/$_npmname/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
