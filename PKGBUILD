# Maintainer: Noa <coolreader18@gmail.com>
pkgname=bitterasm
_pkgver=0.3.0-alpha
pkgver="${_pkgver//-/.}"
pkgrel=1
pkgdesc="A metalanguage for constructing assembly languages"
arch=(x86_64)
url="https://ivanharvard.github.io/bitterasm"
license=('MIT' 'Apache-2.0')
depends=()
makedepends=(cargo coreutils)
options=()
source=("$pkgname-$_pkgver.tar.gz::https://github.com/ivanharvard/bitterasm/archive/refs/tags/v$_pkgver.tar.gz"
				"paths.patch")
sha256sums=('51cd8af4a6c346bac7496e50399618450babcd34bd518e8a3b24fa17f81078c6'
            'b26ae830d52c7caf2b058276c7b881145c4788a04a3031e2d9e64f6e0a325461')

prepare() {
	cd "$pkgname-$_pkgver"
	patch -p1 -i "$srcdir/paths.patch"
}

build() {
	cd "$pkgname-$_pkgver"
	cargo build --release -p bitterasm -p bitter
}

package() {
	cd "$pkgname-$_pkgver"
	install -Dm755 target/release/{bitterasm,bitter} -t "$pkgdir"/usr/bin

	mkdir -p "$pkgdir"/usr/share/bitterasm
	cp -r std/ -t "$pkgdir"/usr/share/bitterasm

	install -Dm644 -t "$pkgdir/usr/share/licenses/${pkgname}" LICENSE-*
}
