# Maintainer: Ratakor <ratakor@disroot.org>

pkgname=poop-git
_pkgname="${pkgname%-git}"
pkgver=0.4.0.r4.g281428f
pkgver() { git -C "$_pkgname" describe --tags | sed 's/^v//;s/-/.r/;s/-/./g'; }
pkgrel=1
pkgdesc="Performance Optimizer Observation Platform"
arch=('x86_64' 'aarch64' 'i686')
url="https://github.com/andrewrk/$_pkgname"
license=('MIT')
makedepends=('git' 'zig')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url")
sha256sums=('SKIP')

build() {
	cd "$srcdir/$_pkgname"
	zig build -Doptimize=ReleaseFast
}

package() {
	cd "$srcdir/$_pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
	install -Dm755 "zig-out/bin/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
