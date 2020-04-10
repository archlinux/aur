# Maintainer: Babets <fbabetz+aur [.at.] yahoo (.dot.) it>
pkgname=me-tv
pkgver=3.0.9
pkgrel=1
pkgdesc="DVB viewer based on GTK+3 and GStreamer"
arch=('x86_64')
url="https://github.com/Me-TV/Me-TV"
license=('GPL3')
depends=('gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'gst-plugins-ugly' 'gst-libav' 'gst-plugin-gtk')
makedepends=('rust' 'meson')
conflicts=("me-tv-git" "me-tv-bzr")
install='me-tv.install'
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Me-TV/Me-TV/archive/v$pkgver.tar.gz")
md5sums=('bd6c5d7aa1e1a2f8e0574deb2425bd7d')

prepare() {
	cp -pr "Me-TV-$pkgver" "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
	meson --prefix /usr --buildtype=plain . build
#	cargo build --release --locked --all-features
	ninja -C build
}

check() {
	cd "$pkgname-$pkgver"
	cargo test --release --locked
#	ninja -C build check
}

package() {
	cd "$pkgname-$pkgver"
#	install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
#	install -Dm 755 target/release/${pkgname}-record -t "${pkgdir}/usr/bin"
#	install -Dm 755 target/release/${pkgname}-schedule -t "${pkgdir}/usr/bin"
	DESTDIR="$pkgdir" ninja -C build install
}

