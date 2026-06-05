# Maintainer: Trumpetrespas <email [at] trumpetrespas [dot] com>
pkgname=tree-sitter-d2
pkgver=0.7.2
pkgrel=1
epoch=
pkgdesc="Tree Sitter grammar for d2lang"
arch=("x86_64")
url="https://github.com/ravsii/tree-sitter-d2"
license=('MIT')
groups=()
depends=("glibc" tree-sitter)
makedepends=(tree-sitter-cli)
checkdepends=(tree-sitter-cli)
optdepends=()
#provides=("lib$pkgname.so")
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver::https://github.com/ravsii/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
noextract=()
sha256sums=('7df50a08ca19b20ee11843b1842b615f3a907182f7e38a5b2ff73e85260ab8bd')
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
	tree-sitter generate grammar.js
	tree-sitter generate src/grammar.json
}

build() {
	cd "$pkgname-$pkgver"

	tree-sitter build --output lib$pkgname.so
}

check() {
	cd "$pkgname-$pkgver"
	tree-sitter test
}

package() {
	install -d "$pkgdir"/usr/lib/tree_sitter

	ln -s /usr/lib/lib$pkgname.so\
		"$pkgdir"/usr/lib/tree_sitter/${pkgname#tree-sitter-}.so

	cd $pkgname-$pkgver
	install -Dm755 -t "$pkgdir"/usr/lib/ lib$pkgname.so
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
	install -Dm644 -t "$pkgdir"/usr/share/tree-sitter/queries/d2 queries/*.scm

}
