pkgname=rpc-bridge
pkgver=1.4.0.1
pkgrel=1
pkgdesc="Enable Rich Presence between your Wine applications and the native Discord client on Linux"
url="https://github.com/EnderIce2/rpc-bridge"
makedepends=("mingw-w64-gcc")
license=("MIT")
arch=("any")
#source=("$pkgname.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
# Needs git clone, since the Makefile is using git to query current commit and branch
source=("$pkgname::git+${url}.git#tag=v${pkgver}")
sha256sums=('10c11e984093ab2b29a4b43375409586bf939dc8bb9c7953e695fa4d8344b5d8')

build() {
	cd "$pkgname"
	make clean
	make build
}

package() {
	install -Dm644 "$pkgname"/build/bridge.sh -t "$pkgdir"/opt/$pkgname/
	install -Dm644 "$pkgname"/build/bridge.exe -t "$pkgdir"/opt/$pkgname/
	install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
