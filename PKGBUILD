# Maintainer: Nova King <technobaboo@proton.me>

pkgname="comet"
pkgver="0.1.0"
pkgrel="1"
pkgdesc="Virtual annotation pen for Stardust XR"
arch=('x86_64')
url="https://github.com/StardustXR/comet"
license=('MIT')
depends=()
makedepends=(
	'rust-musl'
    'cargo'
    'git'
)
source=(
    "git+https://github.com/StardustXR/comet.git"
)
sha256sums=('SKIP')
OPTIONS=(strip lto !debug)

prepare() {
    cd "$srcdir/$pkgname"
    cargo fetch --frozen --target "$CARCH-unknown-linux-musl"
}

build() {
    cd "$srcdir/$pkgname"
    cargo build --locked --release --target "$CARCH-unknown-linux-musl"
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 "target/x86_64-unknown-linux-musl/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 \
		LICENSE \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 \
		README.md \
		"$pkgdir/usr/share/doc/$pkgname/README.md"
}
