# Maintainer: yayaduckd <yayaduckd@proton.me>

pkgname=uwaka-git
_pkgname="${pkgname%-git}"
pkgver=0.5.0
pkgver() { git -C "$_pkgname" describe --tags | sed 's/^v//;s/-/.r/;s/-/./g'; }
pkgrel=1
pkgdesc="Universal Wakatime Client"
arch=('x86_64' 'aarch64' 'i686')
url="https://github.com/yayaduckd/$_pkgname"
license=('MIT')
makedepends=('git' 'zig')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url")
sha256sums=('SKIP')

execname="uwaka_$arch-linux"

build() {
	cd "$srcdir/$_pkgname"
	zig build --release=small
}

package() {
	cd "$srcdir/$_pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
	install -Dm755 "zig-out/bin/$execname" "$pkgdir/usr/bin/$_pkgname"
}

