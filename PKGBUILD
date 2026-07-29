# Maintainer: Phil Kulak <phil@kulak.us>
pkgname=matui
pkgver=1.0.0
pkgrel=1
pkgdesc="An opinionated Matrix TUI client."
makedepends=('cargo')
arch=('x86_64')
url="https://github.com/pkulak/matui"
license=('GPL2')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pkulak/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('be8222bbfa97361f9542bb05d0e4144ea12e00008214f1d4e89473b849191de63a2ba3a965a7285adf1e751c8f3831cf5cdfa837c332aa33e8d4377ef90c8043')

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

