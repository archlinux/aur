# Maintainer: Konrad Wasowicz <exaroth@gmail.com>
pkgname=liveboat
pkgver=1.1.7
pkgrel=1
pkgdesc="Static page generator for Newsboat feeds"
arch=('x86_64')
url="https://github.com/exaroth/liveboat"
license=('MIT')
makedepends=('rust')
source=("https://github.com/exaroth/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
# Non standard
_newsboat_githash="1ea89e860553634e37daf1cc6de2e00a379d6378"
_target="x86_64-unknown-linux-gnu"
md5sums=('59052e65645a267d1b2edc2c5f9f33b4')

prepare() {
    cd "$pkgname-$pkgver"
    make setup
}

build() {
    cd "$pkgname-$pkgver"
    make target_t=$_target build
}

package() {
    cd "$pkgname-$pkgver"
	install -dm0755 "/$pkgdir/usr/bin"
    install target/$_target/release/$pkgname $pkgdir/usr/bin
    install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}
