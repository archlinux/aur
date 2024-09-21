# Maintainer: Franco Bugnano <franco@bugnano.it>

pkgname=archivefs
pkgver=1.0.1
pkgrel=2
pkgdesc="A read-only FUSE filesystem for mounting compressed archives, inspired by archivemount."
arch=('x86_64')
url="https://github.com/bugnano/archivefs"
license=('GPL3')
depends=('libarchive')
makedepends=('cargo' 'asciidoc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bugnano/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('acf784b1e71d331dc9070cfac3606ee9b6b389ba247e9e024eabfb6282f7a96a3fb16948e6f8755d080028f677592c6557de0d9592c16a920c77481603b50703')

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

