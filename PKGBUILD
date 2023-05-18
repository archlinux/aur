# Maintainer: Thomas Frans <franske2000 at gmail dot com>
pkgname=wiki-tui
pkgver=0.7.0
pkgrel=1
pkgdesc="A simple and easy to use Wikipedia Text User Interface"
arch=('x86_64')
url="https://github.com/Builditluc/wiki-tui"
license=('MIT')
depends=('ncurses')
makedepends=('rust' 'cargo' 'git')
provides=("${pkgname}")
conflicts=("${pkgname}")
# The tags provide source, releases don't
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
# No checksum provided for tags
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
    install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm 644 "logo.png" "${pkgdir}/usr/share/pixmaps/wiki-tui.png"
}
