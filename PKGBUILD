# Maintainer: RadioactiveRadio <barraiser59@gmail.com>

pkgname=blue-recorder-git
pkgver=r120.g7a9806e
pkgrel=1
pkgdesc="Simple Screen Recorder written in Rust based on Green Recorder"
arch=('x86_64')
url="https://github.com/xlmnxp/blue-recorder"
license=(GPL3)
depends=(xorg-xwininfo clang cargo pulseaudio ffmpeg)
provides=(blue-recorder-git)
conflicts=(blue-recorder)
source=("git+https://github.com/xlmnxp/blue-recorder.git")
sha256sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd blue-recorder
	cargo build --release
	cp -a data interfaces po target/release
}

package() {
	cd blue-recorder

	install -Dm644 "data/blue-recorder.desktop" "$pkgdir/usr/share/applications/blue-recorder.desktop"

	install -Dm644 "data/blue-recorder.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/blue-recorder.svg"

	install -Dm644 "data/blue-recorder@x96.png" "$pkgdir/usr/share/icons/hicolor/96x96/apps/blue-recorder@x96.png"

	install -Dm644 "data/blue-recorder@x128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/blue-recorder@x128.png"
		
	mkdir -p $pkgdir/usr/bin
	
	cp -r target/release/* $pkgdir/usr/bin

}
