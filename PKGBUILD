# Maintainer: Giancarlo Razzolini <grazzolini@gmail.com>

pkgname=clipboard-sync-git
pkgver=0.2.0.r18.943e49e
pkgrel=1
pkgdesc="Synchronizes the clipboard across multiple X11 and wayland instances running on the same machine"
arch=('x86_64')
url="https://github.com/dnut/clipboard-sync"
license=('GPL3')
depends=('libxcb')
makedepends=('git' 'rust')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
        cd "$srcdir/${pkgname%-git}"
        make install "prefix=$pkgdir/usr"
}
