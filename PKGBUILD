# Maintainer: Phil Kulak <phil@kulak.us>
pkgname=matui
pkgver=0.6.1
pkgrel=2
pkgdesc="An opinionated Matrix TUI client."
makedepends=('cargo')
arch=('x86_64')
url="https://github.com/pkulak/matui"
license=('GPL2')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pkulak/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('ed882ebb14c34362273f73d2a7e16596f608e6b3b16f91fe5f6186a2ba001b3e3d57cc2e2cd8ae6d176112ada8218615ffb46dd3406c4371aa0637b614a61810')

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

