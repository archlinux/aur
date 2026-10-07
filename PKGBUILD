# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=rotate-env
pkgver=0.1.3
pkgrel=1
pkgdesc="Bulk-rotate a leaked API-key env variable across .env and .mcp.json files"
arch=('any')
url="https://github.com/yangsi7/rotate-env"
license=('MIT')
depends=('bash' 'gawk' 'fd')
optdepends=('jq: rotate keys inside .mcp.json files')
checkdepends=('bats' 'jq')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('eb94eb1b5eac2cc0d4b2d19e7ed5d0a360e93d1660ca6aa40b1053a43d7cb283')

check() {
	cd "$pkgname-$pkgver"
	bats tests/rotate.bats
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 rotate "$pkgdir/usr/bin/rotate"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
