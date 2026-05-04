# Contributor: Filipe Nascimento <flipee at tuta dot io>
# Contributor: tee < teeaur at duck dot com >

pkgname=mask
pkgver=0.11.7
pkgrel=1
pkgdesc='A CLI task runner defined by a simple markdown file'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/jakedeichert/mask"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/mask/$pkgver.tar.gz")
sha256sums=('25df4aa1d67d4d9fb7032619951b753be51bb1ec21349316be678b3156ff1874')

prepare() {
    cd mask-$pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd mask-$pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd mask-$pkgname-$pkgver
    install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
