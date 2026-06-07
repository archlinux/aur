pkgname=rpc-bridge
pkgver=1.4.1.3
pkgrel=1
pkgdesc="Enable Rich Presence between your Wine applications and the native Discord client on Linux"
url="https://github.com/EnderIce2/rpc-bridge"
makedepends=("mingw-w64-gcc" "git")
license=("MIT")
arch=("any")
#source=("$pkgname.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
# Needs git clone, since the Makefile is using git to query current commit and branch
source=("$pkgname::git+${url}.git#tag=v${pkgver}")
sha256sums=('67c06c25bfd211758710374d51ba3316f83e2cca1ec7757dc87bbcbfb9d1b6e9')

build() {
	cd "$pkgname"
	make clean
	make build
}

package() {
	install -Dm755 "$pkgname"/build/bridge.sh -t "$pkgdir"/opt/$pkgname/
	install -Dm755 "$pkgname"/build/bridge.exe -t "$pkgdir"/opt/$pkgname/
	install -Dm644 "$pkgname"/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
