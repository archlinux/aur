# Maintainer: Matthew Sexton <wsdmatty@gmail.com>
pkgname=spotify-tray-git
pkgver=r13.2793099
pkgrel=1
pkgdesc="Tray icon for the Spotify Linux client application"
arch=('x86_64')
url="https://github.com/tsmetana/spotify-tray"
license=('GPL3')
depends=('spotify')
makedepends=('git') 
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('spotify-tray::git+https://github.com/tsmetana/spotify-tray.git')
md5sums=('SKIP')

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
