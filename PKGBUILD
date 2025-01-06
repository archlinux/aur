# Maintainer: Kimiblock Moe

pkgname=turnon
pkgdesc="Turn on devices in your local network"
url="https://github.com/swsnr/turnon"
license=("MPL-2.0")
arch=("x86_64" "aarch64")
pkgver=2.2.0
pkgrel=1
makedepends=("rust" "cargo" "git" "blueprint-compiler")
depends=(libadwaita gtk4 hicolor-icon-theme graphene dconf gcc-libs glib2 glibc)
source=("git+https://github.com/swsnr/turnon.git#tag=v${pkgver}")
md5sums=('4707403c0e92ad406e113d9dee86947b')

function prepare() {
	cd "${srcdir}/turnon"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --target "$CARCH-unknown-linux-gnu"
}

function build() {
	cd "${srcdir}/turnon"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	env RUST_BACKTRACE=1 SKIP_BLUEPRINT=1 cargo build --release --locked
	env RUST_BACKTRACE=1 SKIP_BLUEPRINT=1 make msgfmt
}

function check() {
	cd "${srcdir}/turnon"
	export RUSTUP_TOOLCHAIN=stable
	env RUST_BACKTRACE=1 SKIP_BLUEPRINT=1 cargo test --frozen --all-features
}

function package() {
	cd "${srcdir}/turnon"
	#install -Dm755 "${srcdir}/turnon/target/release/turnon" "${pkgdir}/usr/bin/de.swsnr.turnon"
	make LOCALEDIR="${pkgdir}/usr/share/locale" install-locale
	make DESTPREFIX="${pkgdir}/usr" install
	#install -d "${pkgdir}/usr/share/icons/hicolor"
	#cp -r \
	#	resources/icons/* \
	#	"${pkgdir}/usr/share/icons/hicolor"
	#install -Dm644 \
	#	de.swsnr.turnon.desktop \
	#	"${pkgdir}/usr/share/applications/de.swsnr.turnon.desktop"
	#install -Dm644 resources/de.swsnr.turnon.metainfo.xml \
	#	"${pkgdir}/usr/share/metainfo/de.swsnr.turnon.metainfo.xml"
	#install -Dm644 dbus-1/de.swsnr.turnon.service \
	#	"${pkgdir}/usr/share/dbus-1/services/de.swsnr.turnon.service"
	#install -Dm644 \
	#	de.swsnr.turnon.search-provider.ini \
	#	"${pkgdir}/usr/share/gnome-shell/search-providers/de.swsnr.turnon.search-provider.ini"
}



