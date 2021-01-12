# Maintainer: Timo Tabertshofer <timo.tabertshofer@gmail.com>
pkgname=rpiplay-git
_pkgname=rpiplay
pkgver=1.2.r198.e485668
pkgrel=4
pkgdesc="An open-source AirPlay mirroring service"
arch=(x86_64)
url="https://github.com/FD-/RPiPlay"
license=('GPL3')
depends=(avahi gstreamer-vaapi gst-plugins-bad gst-libav)
makedepends=(git cmake libplist openssl) 
provides=("$_pkgname")
conflicts=("$_pkgname")
install="${_pkgname}.install"
source=('rpiplay::git+https://github.com/FD-/RPiPlay')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "1.2.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_pkgname"
	mkdir build
	cd build
	cmake ..
	make
}

package() {
	cd "$srcdir/$_pkgname/build"
	install -Dm755 ./rpiplay "$pkgdir/usr/bin/$_pkgname"
}
