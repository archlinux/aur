# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=gst-plugin-jamesdsp-git
pkgver=r14.378f0fa
pkgrel=1
pkgdesc="JamesDSP wrapper plugin for GStreamer"
arch=('x86_64')
url="https://github.com/ThePBone/gst-plugin-jamesdsp"
license=('GPL2')
depends=('gst-plugins-base-libs')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" 'gst-plugin-viper4linux' 'gst-plugin-viperfx')
install="${pkgname%-git}.install"
source=('git+https://github.com/ThePBone/gst-plugin-jamesdsp.git')
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
