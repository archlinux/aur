pkgname=rpc-bridge-git
_pkgname=rpc-bridge
pkgver=1.4.1.3.r0.6aa6077
pkgrel=1
pkgdesc="Enable Rich Presence between your Wine applications and the native Discord client on Linux"
url="https://github.com/EnderIce2/rpc-bridge"
makedepends=("mingw-w64-gcc" "git")
provides=("$_pkgname=$pkgver")
conflicts=($_pkgname)
license=("MIT")
arch=("any")
source=("$pkgname::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --tags --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/^v//g'
}

build() {
	cd "$pkgname"
	make clean
	make build
}

package() {
	install -Dm755 "$pkgname"/build/bridge.sh -t "$pkgdir"/opt/$_pkgname/
	install -Dm755 "$pkgname"/build/bridge.exe -t "$pkgdir"/opt/$_pkgname/
	install -Dm644 "$pkgname"/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
