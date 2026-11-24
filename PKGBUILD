# Maintainer: Phil Kulak <phil@kulak.us>
pkgname=matui
pkgver=2.0.0
pkgrel=1
pkgdesc="An opinionated Matrix TUI client."
makedepends=('cargo')
checkdepends=('ffmpeg')
optdepends=('ffmpeg: thumbnails for uploaded videos and animated images')
arch=('x86_64')
url="https://github.com/pkulak/matui"
license=('GPL2')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pkulak/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('16a606b8305bb0d9fe429140f95a3d888822dac21b6c6d2925386219ba6b91a5f5f11a5de8aae0704a4a68f8e5ee1f98716ce4a8bb11e400b52e30e1e372b7ee')

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

