pkgname=protobuf-rust-git
pkgver=1.4.1.1227.gf1a21a56
pkgrel=1
pkgdesc="Rust Support for Google's protocol buffers"
arch=('x86_64' 'i686')
url="https://github.com/stepancheg/rust-protobuf"
license=('MIT' 'Apache-2.0')
depends=('protobuf')
makedepends=('cargo')
optdepends=()
provides=('protobuf-rust')
conflicts=('protobuf-rust')
source=($pkgname::git+https://github.com/stepancheg/rust-protobuf.git)
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --tags | sed -e 's/-/./g' -e 's/^v//'
}

build() {
    cd "$pkgname"
    cargo build \
        --package protobuf-codegen \
        --release
}

package() {
    cd "$pkgname"
    install -D -m755 "$srcdir/$pkgname/target/release/protoc-gen-rust" "$pkgdir/usr/bin/protoc-gen-rust"
}
