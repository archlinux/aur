# Maintainer: Nikola Tasić <nik at 7aske dot com>
pkgname="rgs"
pkgver="1.12"
pkgrel=1
pkgdesc="Batch git repository analysis tool"
arch=('x86_64')
url="https://github.com/7aske/rgs"
license=('GPL2')
depends=('libgit2')
makedepends=('cargo')
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)

prepare() {
	cd $pkgname-$pkgver
    	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd $pkgname-$pkgver
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --release --locked --all-features --frozen
}

package() {
	cd $pkgname-$pkgver
	install -Dm 755 target/release/${pkgname} -t ${pkgdir}/usr/bin
	install -Dm 644 README.md -t $pkgdir/usr/share/doc/${pkgname}
	install -Dm 644 LICENSE -t $pkgdir/usr/share/licenses/${pkgname}
}

sha256sums=('b95456fa2d1694f9b05664bb08f8ae6f571cc207efee4f4a9e8abce2541cca35')
