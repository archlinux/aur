# Maintainer: aulonsal <aulonsal at gmail dot com>
pkgname=outfieldr-git
_pkgname="${pkgname%-git}"
pkgver=1.1.1.r3.gfb5ee22
pkgrel=1
pkgdesc='TLDR client in zig'
arch=('x86_64')
url='https://gitlab.com/ve-nt/outfieldr'
license=('MIT')
makedepends=('git' 'zig')
provides=("$_pkgname" 'tldr')
conflicts=("$_pkgname" 'tldr')
source=(
	"git+$url.git"
)
b2sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$_pkgname"

	zig build --release=safe
}

package() {
	cd "$_pkgname"

	DESTDIR="${pkgdir}" zig build install --release=safe
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
