# Maintainer: Mattia Borda <mattiagiovanni.borda@icloud.com>

pkgname=whatsapp-for-linux-git
pkgver=1.5.3.r2.gbdf8328
pkgrel=1
pkgdesc="An unofficial WhatsApp desktop application for linux"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url=https://github.com/eneshecan/${pkgname%-git}
license=(GPL3)
depends=('gtkmm3' 'webkit2gtk' 'libayatana-appindicator' 'libcanberra' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'gst-libav')
makedepends=('cmake' 'git')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=(git+$url)
b2sums=(SKIP)

pkgver() {
	cd ${pkgname%-git}
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd ${pkgname%-git}
	cmake -DCMAKE_INSTALL_PREFIX=/usr .
	make
}

package() {
	cd ${pkgname%-git}
	make DESTDIR="$pkgdir/" install
}
