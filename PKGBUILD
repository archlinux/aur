# Maintainer: Ranadeep B < mail at rnbguy dot at >

pkgname=apalache
pkgver=0.16.1
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
	'util-linux'
)
makedepends=(
	'patch'
)
source=(
	"https://github.com/informalsystems/$pkgname/releases/download/v$pkgver/$pkgname-v$pkgver.tgz"
	'sys-install.patch'
)
sha256sums=(
	'03d564ef93d7634a4710192fcca84d15305846c9dbe437884ea732e78008fef1'
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
