# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: adytzu2007 <adrian.bacircea@gmail.com>
pkgname=cryptopp
pkgver=8.9.0
pkgrel=1
pkgdesc="A free C++ class library of cryptographic schemes"
arch=('x86_64')
url="https://www.cryptopp.com/"
license=('BSL-1.0')
depends=('gcc-libs' 'glibc')
provides=('libcryptopp.so')
source=("https://www.cryptopp.com/cryptopp${pkgver//./}.zip"{,.sig})
b2sums=(
	'95fe0585cff826587a301dd3df863c39cba889d407bb70ae7b35a4f9a0f7f5fef83b1c65cb95923a05f8ae91f18ed20e88738e8bb081a3f9c8c49c2d67d44ecc'
	'SKIP'
)
validpgpkeys=('B8CC19802062211A508B2F5CCE0586AF1F8E37BD') # Jeffrey Walton

prepare() {
	make PREFIX=/usr libcryptopp.pc
}

build() {
	make dynamic
	if ((CHECKFUNC)); then
		make cryptest.exe
	fi
}

check() {
	make test
}

package() {
	# shellcheck disable=SC2154
	make DESTDIR="$pkgdir" PREFIX=/usr install-lib
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname License.txt
}
