# Maintainer: Denilson Sá <denilsonsa@gmail.com>

pkgname=xevil-git
pkgver=r28.9ca8505
pkgrel=1
pkgdesc="Side-view, single or network-multiplayer, fast-action, kill-everything, game."
# Note: building this package on ARM is untested, but it should work due to https://github.com/lvella/xevil/pull/2
#arch=('x86_64' 'armv7h' 'aarch64')
arch=('x86_64')
url="https://www.xevil.com/"
license=('GPL2')
depends=('libx11' 'libxpm' 'xorg-fonts-misc')
makedepends=('git')
source=('git+https://github.com/lvella/xevil.git#branch=master')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	mkdir -p "$pkgdir/usr/bin"
	install -Dm755 x11/REDHAT_LINUX/xevil "$pkgdir/usr/bin/xevil"
	install -Dm755 x11/REDHAT_LINUX/serverping "$pkgdir/usr/bin/xevil-serverping"
	mkdir -p "$pkgdir/usr/share/doc/${pkgname%-git}"
	install -Dm644 instructions/* "$pkgdir/usr/share/doc/${pkgname%-git}/"
	install -Dm644 compiling.html readme.txt "$pkgdir/usr/share/doc/${pkgname%-git}/"
}
