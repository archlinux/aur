# Maintainer: Keon Cachia <keonfarrugia@gmail.com>

pkgname=rill-git
_pkgname=rill
pkgdesc="A minimalist scrolling window manager for River"
pkgver=1fe1ff9
pkgrel=2
arch=('x86_64' 'aarch64')
url="https://codeberg.org/lzj15/rill"
license=('MIT')
depends=('wayland' 'river')
makedepends=('zig'
	'wayland-protocols')
install=rill.install
source=(git+$url.git)
sha256sums=('SKIP')
pkgver() {
	cd $_pkgname
	printf "$(git rev-parse --short=7 HEAD)"
}
build() {
	cd $_pkgname
	zig build -Doptimize=ReleaseSafe
}
package() {
	cd $_pkgname
	install -Dm 755 LICENSE -t "$pkgdir/usr/share/licenses/rill/"
	cd zig-out/bin
	install -Dm 755 rill -t "$pkgdir/usr/bin/"
}
