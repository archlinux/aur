# Maintainer: Yufan You <ouuansteve at gmail>

_npmname=server
_npmscope=@volar
pkgname=volar-server
pkgver=0.27.11
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
sha256sums=('7c9fc8e3130a4aebbf8981bb0985bf67455c98072515329f1bb23e6c12a4bc9c'
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
