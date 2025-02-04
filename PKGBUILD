# Maintainer: fossdd <fossdd@pwned.life
# Contributor: Julian <juliannfairfax@protonmail.com>

pkgname=pipeline-gtk
pkgver=2.1.1
pkgrel=1
pkgdesc="Watch YouTube and PeerTube videos in one place"
arch=("x86_64" "aarch64" "riscv64")
url="https://gitlab.com/schmiddi-on-mobile/pipeline"
license=("GPL-3.0-or-later")
depends=("libadwaita" "libclapper" "libclapper-gtk" "gst-plugins-gtuber")
makedepends=("blueprint-compiler" "rust" "meson")
conflicts=("tubefeeder")
replaces=("tubefeeder")
source=("https://gitlab.com/schmiddi-on-mobile/pipeline/-/archive/v$pkgver/pipeline-v$pkgver.tar.gz")
sha256sums=('70b72f20d92691477fcc2ea0c6907fb501990db73aed653e5201116fceee10c9')
options=(!lto)

build() {
	arch-meson pipeline-v$pkgver build
	meson compile -C build
}

package() {
	meson install -C build --no-rebuild --destdir "$pkgdir"

	ln -s tubefeeder "$pkgdir"/usr/bin/pipeline
}
