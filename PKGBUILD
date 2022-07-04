# Maintainer: HaoCheng <ch1994@outlook.com>
pkgname=netease-cloud-music-gtk4
_pkgname=netease-cloud-music-gtk
pkgver=2.0.1
pkgrel=1
pkgdesc="Linux 平台下基于 Rust + GTK 开发的网易云音乐播放器"
arch=('i686' 'x86_64')
url="https://github.com/gmg137/netease-cloud-music-gtk"
license=('GPL3')
depends=(
	'libadwaita'
)
# optdepends=(
#     'gst-plugins-bad: Extra media codecs'
#     'gst-plugins-good: Extra media codecs'
#     'gst-plugins-ugly: Extra media codecs'
#     'gst-libav: Extra media codecs'
# )
makedepends=('cargo' 'meson')
#options=(!lto)
source=("https://github.com/gmg137/$_pkgname/archive/$pkgver.tar.gz")
sha256sums=('dc366631d9d22e91f75525b8d4365fa8ec4945435b1c6a70316dd29154fcabb7')

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

