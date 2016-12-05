pkgname=ydcv-rs-git
_pkgname="ydcv-rs"
pkgdesc="A Rust version of ydcv."
pkgver=0.3.4.67
pkgrel=1
arch=('i686' 'x86_64')
conflicts=("ydcv")
provides=("ydcv")
url="https://github.com/farseerfc/ydcv-rs"
license=('MIT' 'GPL2')
depends=("openssl" "libdbus")
optdepends=("xsel: for X selection")
makedepends=('git' 'cargo' 'python-pytoml')
source=('git://github.com/farseerfc/ydcv-rs.git')
sha256sums=('SKIP')

pkgver() {
	cd $_pkgname
	echo "$(python -c "print(__import__('pytoml').loads(open('Cargo.toml').read())['package']['version'])").$(git rev-list --count HEAD)"
}

build() {
	cd $_pkgname
	cargo build --no-default-features --features "notify-rust" --release
}

check() {
	cd $_pkgname
	cargo test --no-default-features --features "notify-rust" --release
}

package() {
	cd $_pkgname
	install -D -m755 "$srcdir/$_pkgname/target/release/ydcv-rs" "$pkgdir/usr/bin/ydcv"
}
