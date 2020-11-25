# Maintainer: Filipe Nascimento <flipee at tuta dot io>
# Contributor: Attenuation <ouyangjun1999@gmail.com>

pkgname=procs
pkgver=0.10.9
pkgrel=1
pkgdesc="A modern replacement for ps written in Rust"
arch=('x86_64')
url="https://github.com/dalance/procs"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('ced04189e2fd9b6a5133b3bceaeaa5fc1850f7a3c44e46ff2d94e0fc5bc01623')

build() {
    cd $pkgname-$pkgver
    cargo build --release --locked
    target/release/procs --completion zsh
    target/release/procs --completion bash
    target/release/procs --completion fish
}

check() {
    cd $pkgname-$pkgver
    cargo test --release --locked
}

package() {
    cd $pkgname-$pkgver
    install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 _procs -t "$pkgdir/usr/share/zsh/site-functions"
    install -Dm644 procs.bash "$pkgdir/usr/share/bash-completion/completions/procs"
    install -Dm644 procs.fish -t "$pkgdir/usr/share/fish/vendor_completions.d"
}
