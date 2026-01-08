pkgname=mollysocket
pkgdesc='MollySocket allows getting Signal notifications via UnifiedPush.'
url="https://github.com/mollyim/mollysocket"
license=("AGPL-3.0")
arch=(x86_64 aarch64)
pkgver=1.6.0
pkgrel=1
makedepends=(cargo clang)
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('0e6dc9c9711471156b7c52365c351f75a56b032e53209970bac733f0d9c5c3ef')
options=(!lto !debug)
backup=("etc/mollysocket/config.toml")

function prepare() {
	cd $srcdir/$pkgname-$pkgver
	cargo fetch --locked
}

function build() {
	cd $srcdir/$pkgname-$pkgver
	cargo build --frozen --release --locked
}

function package() {
	install -d -m755 -o root -g root $srcdir/$pkgname-$pkgver/target/release/$pkgname $pkgdir/usr/bin/$pkgname
}
