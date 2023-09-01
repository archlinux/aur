# Maintainer: dimtpap <dimtpap@protonmail.com>
pkgname=coppwr
pkgver=1.2.0
pkgrel=1
pkgdesc='Low level PipeWire control GUI'
arch=('x86_64')
url='https://dimtpap.xyz/coppwr'
license=('GPL3')
depends=('pipewire')
provides=('coppwr')
makedepends=('cargo' 'clang' 'libpipewire')
optdepends=('xdg-desktop-portal: Camera and Screencast XDP support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dimtpap/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=("f63f29b3db7b66a09f45aac8a1b156ff1c4244f47cd12500f8c996b223edc511")

prepare() {
	cd "$pkgname-$pkgver"

	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$pkgname-$pkgver"

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

package() {
	cd "$pkgname-$pkgver"

	install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "assets/xyz.dimtpap.coppwr.desktop" "$pkgdir/usr/share/applications/xyz.dimtpap.coppwr.desktop"
	install -Dm644 "assets/xyz.dimtpap.coppwr.metainfo.xml" "$pkgdir/usr/share/metainfo/xyz.dimtpap.coppwr.metainfo.xml"
	install -Dm644 "assets/icon/scalable.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/xyz.dimtpap.coppwr.svg"
	install -Dm644 "assets/icon/512.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/xyz.dimtpap.coppwr.png"
	install -Dm644 "assets/icon/256.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/xyz.dimtpap.coppwr.png"
	install -Dm644 "assets/icon/128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/xyz.dimtpap.coppwr.png"
	install -Dm644 "assets/icon/64.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/xyz.dimtpap.coppwr.png"
	install -Dm644 "assets/icon/48.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/xyz.dimtpap.coppwr.png"
	install -Dm644 "assets/icon/32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/xyz.dimtpap.coppwr.png"
}