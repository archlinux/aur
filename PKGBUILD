# Maintainer: Dimitri Merejkowsky <dimitri at dmerej.info>
# https://wiki.archlinux.org/index.php/Rust_package_guidelines

pkgname=agate
pkgver=2.5.3
pkgrel=1
pkgdesc="Simple static file server for the Gemini network protocol, written in Rust"
makedepends=('cargo')
arch=('x86_64')
url="https://github.com/mbrubeck/agate"
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v${pkgver}.tar.gz")
license=('APACHE' 'MIT')

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
md5sums=('b93bd674b0098f231231b6c325152503')
