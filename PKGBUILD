# Maintainer: Nikola Hadžić <nikola@firemail.cc>
pkgname=gst-plugins-rs
pkgver=0.5.0
pkgrel=1
epoch=
pkgdesc="GStreamer plugins written in Rust"
arch=("x86_64")
url="https://gstreamer.freedesktop.org/"
license=("LGPL" "MIT" "Apache")
groups=()
depends=("gstreamer")
makedepends=("rust" "git")
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
source=("git+https://gitlab.freedesktop.org/gstreamer/gst-plugins-rs.git")
noextract=("git+https://gitlab.freedesktop.org/gstreamer/gst-plugins-rs.git")
sha256sums=(SKIP)

prepare() {
	cd "$srcdir/$pkgname"
	git checkout $pkgver
}

build() {
	cd "$srcdir/$pkgname"
	cargo build --release
}

package() {
	cd "$srcdir/$pkgname"
	mkdir -vp "$pkgdir/${GST_PLUGIN_PATH:-/usr/lib/gstreamer-1.0/}"
	cp -v "$srcdir/$pkgname/target/release/*.so" "$pkgdir/${GST_PLUGIN_PATH:-/usr/lib/gstreamer-1.0/}"
}

