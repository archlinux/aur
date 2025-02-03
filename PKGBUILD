# Maintainer: Konrad Wasowicz <exaroth@gmail.com>
pkgname=liveboat
pkgver=1.1.4
pkgrel=1
pkgdesc="Static page generator for Newsboat feeds"
arch=('x86_64')
url="https://github.com/exaroth/liveboat"
license=('MIT')
makedepends=('rust')
source=("https://github.com/exaroth/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
# Non standard
_newsboat_githash="1ea89e860553634e37daf1cc6de2e00a379d6378"
_target="x86_64-unknown-linux-musl"
md5sums=('e42d7ba7f8c522931b2dcf3b2c8b793d')

prepare() {
    cd "$pkgname-$pkgver"
    make setup
}

build() {
    cd "$pkgname-$pkgver"
    make build
}

package() {
    cd "$pkgname-$pkgver"
	install -dm0755 "/$pkgdir/usr/bin"
    install target/$_target/release/$pkgname $pkgdir/usr/bin
    install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}
