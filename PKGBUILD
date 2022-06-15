# Maintainer: Thomas Frans <franske2000 at gmail dot com>
pkgname=wiki-tui
pkgver=0.4.8
pkgrel=1
pkgdesc="A simple and easy to use Wikipedia Text User Interface"
arch=('x86_64')
url="https://github.com/Builditluc/wiki-tui"
license=('MIT')
depends=('ncurses')
makedepends=('rust' 'cargo' 'git')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('SKIP')

prepare() {
	cd "$pkgname-$pkgver"
    cargo fetch --locked
}

build() {
	cd "$pkgname-$pkgver"
    cargo build --locked --release
}

check() {
	cd "$pkgname-$pkgver"
    cargo test --locked --release
}

package() {
	cd "$pkgname-$pkgver"
    install -Dm 755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm 644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
