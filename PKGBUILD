# Maintainer: dimtpap <dimtpap@protonmail.com>
pkgname=coppwr
pkgver=1.5.0
pkgrel=1
pkgdesc='Low level PipeWire control GUI'
arch=('x86_64')
url='https://dimtpap.ovh/coppwr'
license=('GPL3')
depends=('pipewire')
provides=('coppwr')
makedepends=('cargo' 'clang' 'libpipewire')
optdepends=('xdg-desktop-portal: Camera and Screencast XDP support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dimtpap/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=("61f6b64578fdb6b2a425900f743096c8529a71c5c89159daa9cc09b16ed08fae")

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
	install -Dm644 "assets/io.github.dimtpap.coppwr.desktop" "$pkgdir/usr/share/applications/io.github.dimtpap.coppwr.desktop"
	install -Dm644 "assets/io.github.dimtpap.coppwr.metainfo.xml" "$pkgdir/usr/share/metainfo/io.github.dimtpap.coppwr.metainfo.xml"
	install -Dm644 "assets/icon/scalable.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.github.dimtpap.coppwr.svg"
	install -Dm644 "assets/icon/512.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/io.github.dimtpap.coppwr.png"
	install -Dm644 "assets/icon/256.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/io.github.dimtpap.coppwr.png"
	install -Dm644 "assets/icon/128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/io.github.dimtpap.coppwr.png"
	install -Dm644 "assets/icon/64.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/io.github.dimtpap.coppwr.png"
	install -Dm644 "assets/icon/48.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/io.github.dimtpap.coppwr.png"
	install -Dm644 "assets/icon/32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/io.github.dimtpap.coppwr.png"
}