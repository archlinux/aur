# Maintainer: Nikola Tasić <nik at 7aske dot com>
pkgname="rgs"
pkgver="1.14.4"
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
	install -Dm 755 target/release/${pkgname} -T ${pkgdir}/usr/bin/rgs
	install -Dm 755 target/release/${pkgname} -T ${pkgdir}/usr/bin/cgs
	install -Dm 644 README.md -t $pkgdir/usr/share/doc/${pkgname}
	install -Dm 644 LICENSE -t $pkgdir/usr/share/licenses/${pkgname}
}

sha256sums=('2b228e2a4cca1dd66124eed0caf08e6b05199fd1476968df2318c17af27f4d75')
