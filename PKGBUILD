# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Peter Nguyen <peter.hieu.nguyen@gmail.com>

pkgname=mongrel2
pkgver=1.12.0
pkgrel=1
pkgdesc="Application, language, and network architecture agnostic web server"
url="http://mongrel2.org"
license=("BSD")
arch=("i686" "x86_64")
depends=("sqlite3" "zeromq")
source=("https://github.com/mongrel2/mongrel2/releases/download/v$pkgver/$pkgname-v$pkgver.tar.bz2")
sha256sums=('054b87d94f5c2fb5311ad7979276ce12684f72bff476fdf943e1c485723e9f3c')

build() {
    cd "$srcdir"/$pkgname-v$pkgver
    OPTFLAGS="$CFLAGS -Wno-implicit-fallthrough -Wno-unused -Wno-unused-result" make -f localmbedtls.mak
}

check() {
    cd "$srcdir"/$pkgname-v$pkgver
    make -f localmbedtls.mak tests
}

package() {
    cd "$srcdir"/$pkgname-v$pkgver
    make -f localmbedtls.mak PREFIX="$pkgdir"/usr install
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
