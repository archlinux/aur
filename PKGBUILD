# Maintainer: Franco Bugnano <franco@bugnano.it>

pkgname=archivefs
pkgver=1.0.0
pkgrel=1
pkgdesc="A read-only FUSE filesystem for mounting compressed archives, inspired by archivemount."
arch=('x86_64')
url="https://github.com/bugnano/archivefs"
license=('GPL3')
depends=('libarchive')
makedepends=('cargo' 'asciidoc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bugnano/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('b9dacea8f2d01465db5f527aae4c0c6e4b64fa919a034ca78b48912c776af7290358affe1b612116d3f63b6f143ae0bb0b6eaa1c4bd9870593db4e669c89a926')

build() {
	cd "$pkgname-$pkgver"

	cargo build --release --locked

	a2x -f manpage doc/archivefs.1.adoc
}

package() {
	cd "$pkgname-$pkgver"

	install -D -m755 "target/release/archivefs" "$pkgdir/usr/bin/archivefs"
	install -D -m644 "doc/archivefs.1" "$pkgdir/usr/share/man/man1/archivefs.1"
	install -D -m644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
	install -D -m644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

