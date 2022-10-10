# Maintainer: Martin Kühl <martin.kuehl@posteo.net>
pkgname=color-scheme-monitor
pkgver=0.1.1
pkgrel=1
epoch=
pkgdesc="Monitor the system-wide color scheme and adapt unaware applications to it"
arch=(i686 x86_64 armv6h armv7h)
url="https://codeberg.org/mkhl/color-scheme-monitor/"
license=(custom:0BSD)
groups=()
depends=(dbus xdg-desktop-portal)
makedepends=(cargo sed)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/mkhl/$pkgname/archive/v$pkgver.tar.gz")
noextract=()
sha512sums=('cb941441f867b23ee08b4397dea6a82a97a731426459bfb073d6a70494cec92d2490723812a43a2f830f974d2581446f838aea2f477d977459e68e1528fc8df4')
validpgpkeys=()

prepare() {
	cd "$pkgname"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

check() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features
}

package() {
	cd "$pkgname"
	DESTDIR="$pkgdir/" PREFIX=/usr ./install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
