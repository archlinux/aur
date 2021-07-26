# Maintainer: Ranadeep B < mail at rnbguy dot at >

pkgname=apalache
pkgver=0.15.11
pkgrel=1
pkgdesc="Apalache: symbolic model checker for TLA+"
arch=('any')
url="https://$pkgname.informal.systems/"
license=('Apache')
depends=(
	'java-runtime>=11'
	'glibc=2.33'
	'findutils'
	'coreutils'
	'linux-utils'
)
makedepends=(
	'patch'
)
source=(
	"https://github.com/informalsystems/$pkgname/releases/download/v$pkgver/$pkgname.tgz"
	'https://raw.githubusercontent.com/informalsystems/apalache/unstable/LICENSE'
	'sys-install.patch'
)
sha256sums=(
	'd67bd61a7a4b2c4003beaec97536c68122c3fa653220e935c99c5175c3955f2b'
	'7408d4d61efe32fe697cf519374ba5d85d45fe3eb0b51d486a16888be73fb6f4'
	'825557bfdd2928787480e7d21e3b8397e48080fddc3fa6656d4b910db6c58c01'
)

prepare() {
	patch --directory="$srcdir" --forward --strip=1 --input="$srcdir/sys-install.patch"
}

package() {
	install -Dt "$pkgdir/usr/bin" "bin/$pkgname-mc"
	install -Dt "$pkgdir/opt/$pkgname" "mod-distribution/target/$pkgname-pkg-$pkgver-full.jar"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	ln -s "/usr/bin/$pkgname-mc" "$pkgdir/usr/bin/$pkgname"
}
