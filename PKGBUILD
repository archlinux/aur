# Maintainer: Konrad Wasowicz <exaroth@gmail.com>
pkgname=liveboat
pkgver=1.0.3
pkgrel=1
pkgdesc="Static page generator for Newsboat feeds"
arch=('x86_64')
url="https://github.com/exaroth/liveboat"
license=('MIT')
makedepends=('rust')
source=("https://github.com/exaroth/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('6a602babb59e1fdcc92c9160d2f9e6ae')
# Non standard
_newsboat_githash="1ea89e860553634e37daf1cc6de2e00a379d6378"
_target="x86_64-unknown-linux-musl"

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
