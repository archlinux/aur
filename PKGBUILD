# Maintainer: fossdd <fossdd@pwned.life
# Contributor: Julian <juliannfairfax@protonmail.com>

pkgname=pipeline-gtk
pkgver=2.1.0
pkgrel=2
pkgdesc="Watch YouTube and PeerTube videos in one place"
arch=("x86_64" "aarch64" "riscv64")
url="https://gitlab.com/schmiddi-on-mobile/pipeline"
license=("GPL-3.0-or-later")
depends=("libadwaita" "libclapper" "libclapper-gtk" "gst-plugins-gtuber")
makedepends=("blueprint-compiler" "rust" "meson")
conflicts=("tubefeeder")
replaces=("tubefeeder")
source=("https://gitlab.com/schmiddi-on-mobile/pipeline/-/archive/v$pkgver/pipeline-v$pkgver.tar.gz")
sha256sums=('26b06609e89b3d88c96b57a6a3a4559f83135cab26a7975136c6cd249d43ee3e')
options=(!lto)

build() {
	arch-meson pipeline-v$pkgver build
	meson compile -C build
}

package() {
	meson install -C build --no-rebuild --destdir "$pkgdir"

	ln -s tubefeeder "$pkgdir"/usr/bin/pipeline
}
