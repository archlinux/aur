# Maintainer: Mads Kjeldgaard <mail@madskjeldgaard.dk>
pkgname=osccli
pkgver=0.1.0.12.gb804495
pkgrel=1
pkgdesc="Fast and simple cli tool for Open Sound Control communication, written in Rust"
arch=('x86_64')
url="https://github.com/madskjeldgaard/osccli"
license=('GPL')
groups=('pro-audio')
depends=()
makedepends=('rust' 'cargo' 'git')
source=("$pkgname::git://github.com/madskjeldgaard/osccli.git")
sha256sums=("SKIP")

pkgver() {
    cd "$pkgname"
    echo "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2).$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

check() {
    cd "$pkgname"
    cargo test --locked
}

build() {
	cd "$pkgname"
	cargo build --release
}

package() {
	cd "$pkgname"
	install -Dm755 "target/release/osccli" "$pkgdir/usr/bin/$pkgname"
}
