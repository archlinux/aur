# Maintainer: musiclover <musiclover382@protonmail.com>

pkgname=whatsapp-for-linux-git
pkgver=1.4.7.r13.g841d2d4
pkgrel=1
pkgdesc="An unofficial WhatsApp desktop application for linux"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url=https://github.com/eneshecan/${pkgname%-git}
license=('GPL3')
depends=('gtkmm3' 'webkit2gtk' 'libayatana-appindicator' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'gst-libav')
makedepends=('cmake' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git)
b2sums=('SKIP')

pkgver() {
	cd ${pkgname%-git}
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd ${pkgname%-git}
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr .
	make
}

package() {
	cd ${pkgname%-git}
	make DESTDIR="$pkgdir/" install
}
