# Maintainer: Dimitri Merejkowsky <dimitri at dmerej.info>
# https://wiki.archlinux.org/index.php/Rust_package_guidelines

pkgname=agate
pkgver=3.3.0
pkgrel=2
pkgdesc="Simple static file server for the Gemini network protocol, written in Rust"
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
arch=('x86_64')
url="https://github.com/mbrubeck/agate"
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v${pkgver}.tar.gz")
license=('APACHE' 'MIT')
options=("!lto") # see: https://github.com/briansmith/ring/issues/1444

prepare() {
  cd $pkgname-$pkgver
}

build() {
    cd $pkgname-$pkgver
    cargo build --release --locked --all-features --target-dir=target
}

check() {
    cd $pkgname-$pkgver
    cargo test --release --locked --target-dir=target
}

package() {
    cd $pkgname-$pkgver
    install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
    install -Dm644 "LICENSE-APACHE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE-APACHE"
    install -Dm644 "LICENSE-MIT" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE-MIT"
}
md5sums=('12d0e7c1ef1c476b29318717d968395a')
