# Maintainer: HaoCheng <ch1994@outlook.com>
pkgname=netease-cloud-music-gtk4
_pkgname=netease-cloud-music-gtk
pkgver=2.0.2
pkgrel=2
pkgdesc="Linux 平台下基于 Rust + GTK4 开发的网易云音乐播放器"
arch=('i686' 'x86_64')
url="https://github.com/gmg137/netease-cloud-music-gtk"
license=('GPL3')
depends=(
	'libadwaita'
	'gst-plugins-base'
)
optdepends=(
	'gst-plugins-bad: extra media codecs'
	'gst-plugins-good: extra media codecs'
	'gst-plugins-ugly: extra media codecs'
 )
makedepends=('cargo' 'meson')
conflicts=(
	'netease-cloud-music-gtk-bin'
	'netease-cloud-music-gtk4-git'
)
source=("https://github.com/gmg137/$_pkgname/archive/$pkgver.tar.gz")
sha256sums=('1092b87cd201bc8f51b9c5e76aaf041194085055b59118282ea8a94f251a9fa0')

build() {
	cd "$_pkgname-$pkgver"
	# Generate Cargo.lock
	cargo check -r
	CFLAGS+=" -ffat-lto-objects"
	meson --prefix=/usr \
		--buildtype=release \
		-Dlocaledir=share/locale \
		-Ddatadir=share \
		. \
		build
	meson compile -C build
}

package() {
	cd "$_pkgname-$pkgver"
	meson install -C build --destdir "$pkgdir"
}

