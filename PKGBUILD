# Maintainer: Myriade <myriademedieval@proton.me>
pkgname=dong
pkgver=0.3.0
pkgrel=1
pkgdesc="A striking clock on your computer"
arch=(x86_64)
url="https://gitlab.com/TuTiuTe/dong"
license=('GPL-3.0-only')
depends=(
	alsa-lib
	glibc
	gcc-libs
	glibc
)
makedepends=(
	cargo
	alsa-lib
)
provides=(dong)
conflicts=(dong)
source=($url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz)
noextract=()
sha256sums=('4d5fe142771350b992b8e95eb91d12ac24c7d5d2af2178ad223cf674c7469562')
options=(!lto !debug)

prepare() {
	cd "$pkgname-v$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$pkgname-v$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

# check() {
# 	cd "$pkgname-v$pkgver"
# 	export RUSTUP_TOOLCHAIN=stable
# 	export CARGO_TARGET_DIR=target
# 	cargo test --frozen --all-features
# }

package() {
	cd "$pkgname-v$pkgver"
	install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/$pkgname"
	install -Dm644  "daemon/systemd/dong.service" "${pkgdir}/etc/systemd/user/dong.service"
	install -Dm644  "desktop-entry/org.mitsyped.dong.desktop" "${pkgdir}/usr/share/applications/org.mitsyped.dong.desktop"
	install -Dm644  "desktop-entry/icons/hicolor/128x128/apps/dong.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/dong.png"
	install -Dm644  "desktop-entry/icons/hicolor/64x64/apps/dong.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/dong.png"
	install -Dm644  "desktop-entry/icons/hicolor/32x32/apps/dong.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/dong.png"
	install -Dm644  "desktop-entry/icons/hicolor/16x16/apps/dong.png" "${pkgdir}/usr/share/icons/hicolor/16x16/apps/dong.png"
	install -Dm644  "desktop-entry/icons/hicolor/scalable/apps/dong.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/dong.svg"
	install -Dm644  "desktop-entry/icons/hicolor/symbolic/apps/dong.svg" "${pkgdir}/usr/share/icons/hicolor/symbolic/apps/dong.svg"
}
