# Maintainer: SimPilotAdamT <adam_tazul@outlook.com>

pkgname=spotify-tray-git
pkgver=1.3.2.r0.g99d1fc5
pkgrel=3
pkgdesc="Tray icon for the Spotify Linux client application"
arch=('x86_64')
url="https://github.com/tsmetana/spotify-tray"
license=('GPL3')
depends=('spotify' 'gtk3')
makedepends=('git') 
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('spotify-tray::git+https://github.com/tsmetana/spotify-tray.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/${pkgname%-git}"
	sed -i -e '/^AM_INIT_AUTOMAKE$/d' configure.ac || die
	autoreconf -ivf
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir" install
}
