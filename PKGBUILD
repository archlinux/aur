# Maintainer: Phil Kulak <phil@kulak.us>
pkgname=matui
pkgver=1.0.2
pkgrel=1
pkgdesc="An opinionated Matrix TUI client."
makedepends=('cargo')
arch=('x86_64')
url="https://github.com/pkulak/matui"
license=('GPL2')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pkulak/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('c24ca5ad205db1e3ac4205963cbf68284757d878ad7b887e0d3d996014bb13aeeb5a91bf96b8de3dff23064d6c5f4fc007bdc5e57e48f07743827238764d1c87')

build() {
    cd "$pkgname-$pkgver"
    env -u CFLAGS -u CXXFLAGS -u LDFLAGS cargo build --release --locked --all-features
}

check() {
    cd "$pkgname-$pkgver"
    env -u CFLAGS -u CXXFLAGS -u LDFLAGS cargo test --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
}

