# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=gst-plugin-jamesdsp-git
pkgver=r26.ccddd23
pkgrel=3
pkgdesc="JamesDSP wrapper plugin for GStreamer"
arch=('x86_64')
url="https://github.com/Audio4Linux/gst-plugin-jamesdsp"
license=('GPL2')
depends=('gst-plugins-base-libs' 'libsamplerate' 'libsndfile')
makedepends=('git')
provides=("${pkgname%-git}" 'libgstjdspfx')
conflicts=("${pkgname%-git}" 'libgstjdspfx' 'gst-plugin-viper4linux' 'gst-plugin-viperfx')
source=('git+https://github.com/Audio4Linux/gst-plugin-jamesdsp.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
