# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=video-trimmer
pkgver=0.3.0
pkgrel=1
pkgdesc="Trim videos quickly"
arch=('x86_64')
url="https://gitlab.gnome.org/YaLTeR/video-trimmer"
license=('GPL3')
depends=('gtk3' 'gst-plugins-good' 'ffmpeg')
makedepends=('meson' 'cargo')
checkdepends=('appstream')
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('199dacfb6ea94b039800dec5527e5843f41549988404d96b721f48dd941efd9a')

build() {
	arch-meson "$pkgname-v$pkgver" build
	meson compile -C build
}

check() {
	meson test -C build

	cd "$pkgname-v$pkgver"
	cargo test --release
}

package() {
	DESTDIR="$pkgdir" meson install -C build
}
