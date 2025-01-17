# Maintainer: Franco Bugnano <franco@bugnano.it>

pkgname=fcd
pkgver=1.0.1
pkgrel=1
pkgdesc="Text mode file manager combining the best features of ranger and mc"
arch=('x86_64' 'aarch64')
url="https://github.com/bugnano/fcd"
license=('GPL-3.0-or-later')
makedepends=('cargo' 'asciidoctor')
optdepends=('archivefs: compressed archive support')
replaces=('rnr-fm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bugnano/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('66263d3e667d073c4623fea1834f5d02298e4dd13479aff6836ac59ba768229bfba618a274504235a60853054fcd5ede2490da7f60ceacaad24759eb54311e58')

build() {
	cd "$pkgname-$pkgver"

	cargo build --release --locked

	asciidoctor -b manpage doc/fcd.1.adoc
	asciidoctor -b manpage doc/fcd-view.1.adoc
}

package() {
	cd "$pkgname-$pkgver"

	install -D -m755 "target/release/fcd" "$pkgdir/usr/bin/fcd"
	install -D -m644 "doc/fcd.1" "$pkgdir/usr/share/man/man1/fcd.1"
	install -D -m644 "doc/fcd-view.1" "$pkgdir/usr/share/man/man1/fcd-view.1"
	install -D -m644 "fcd.sh" "$pkgdir/usr/share/${pkgname}/fcd.sh"
	install -D -m644 "fcd.sh" "$pkgdir/etc/profile.d/fcd.sh"
	install -D -m644 "fcd.fish" "$pkgdir/usr/share/${pkgname}/fcd.fish"
	install -D -m644 "fcd.fish" "$pkgdir/etc/fish/functions/fcd.fish"
	install -D -m644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
	install -D -m644 "CHANGELOG.md" "$pkgdir/usr/share/doc/${pkgname}/CHANGELOG.md"
	install -D -m644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

