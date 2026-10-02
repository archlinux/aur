# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=tshare
pkgver=1.1.8
pkgrel=1
pkgdesc="The fastest way to share your files on the web, for free"
arch=('x86_64' 'aarch64')
url="https://github.com/trikko/tshare"
license=('MIT')
depends=('curl' 'zlib' 'gcc-libs')
makedepends=('ldc' 'dub')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c585824179322634be0bb48128ca1eebb8c449c2a27650c24c4a6f6af34cf65c')

build() {
	cd "tshare-$pkgver"
	export DFLAGS="-L-lz -L-lcurl"
	export DUB_HOME="$srcdir/dub-home"
	dub build --compiler=ldc2 -b release
}

package() {
	cd "tshare-$pkgver"
	install -Dm755 tshare "$pkgdir/usr/bin/tshare"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
