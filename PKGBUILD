# Maintainer: Ranadeep B < mail at rnbguy dot at >

_pkgname=apalache
pkgname=$_pkgname-bin
pkgver=0.17.4
pkgrel=1
pkgdesc="A symbolic model checker for TLA+"
arch=('any')
url="https://$_pkgname.informal.systems/"
license=('Apache')
provides=("${_pkgname}")
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
	"https://github.com/informalsystems/$_pkgname/releases/download/v$pkgver/$_pkgname-v$pkgver.tgz"
	'sys-install.patch'
)
sha256sums=(
	'd4cf255edf85f0a1612394337898bbaa3a0f1c3ddc46940dfa7acfe597e223db'
	'825557bfdd2928787480e7d21e3b8397e48080fddc3fa6656d4b910db6c58c01'
)

prepare() {
	patch --directory="$srcdir" --forward --strip=1 --input="$srcdir/sys-install.patch"
}

package() {
	install -Dt "$pkgdir/usr/bin" "bin/$_pkgname-mc"
	install -Dt "$pkgdir/opt/$_pkgname" "mod-distribution/target/$_pkgname-pkg-$pkgver-full.jar"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"

	ln -s "/usr/bin/$_pkgname-mc" "$pkgdir/usr/bin/$_pkgname"
}
