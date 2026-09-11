# Maintainer: Laura Demkowicz-Duffy <laura at demkowiczduffy dot co dot uk>
_pkgname=tytanic
pkgname=$_pkgname-bin
pkgver=0.4.1
pkgrel=1
pkgdesc="A test runner for typst projects"
arch=(x86_64 aarch64)
url="https://github.com/typst-community/tytanic"
license=('MIT OR Apache-2.0')
depends=()
makedepends=('mdbook')
provides=($_pkgname)
conflicts=($_pkgname)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
source_x86_64=("$url/releases/download/v$pkgver/tytanic-$CARCH-unknown-linux-musl.tar.xz")
source_aarch64=("$url/releases/download/v$pkgver/tytanic-$CARCH-unknown-linux-musl.tar.xz")
sha256sums=('9acdf96fba301efb4b92cf5b67f6a2b454315aaf3aea79c0a68a13644b2881a8')
sha256sums_x86_64=('cf262206b2c89f4d74690b5c825d5ffce1f633eb2900948b50cc006dccebe32c')
sha256sums_aarch64=('5d3ccd7b58fe0d60717df50ce429fc39dc8be0abfc166817bdce1b2b7722190e')

build() {
	cd "$_pkgname-$pkgver"
	mdbook build docs/book
}

package() {
	(
		cd "$_pkgname-$pkgver/docs/book/build"
		find -type f -exec install -Dm0644 "{}" "$pkgdir/usr/share/doc/$pkgname/book/{}" \;
	)

	cd "$_pkgname-$CARCH-unknown-linux-musl"
	install -Dm0644 "LICENSE.Apache-2.0" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.Apache-2.0"
	install -Dm0644 "LICENSE.MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.MIT"
	install -Dm0644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm0755 tt "$pkgdir/usr/bin/tt"
}
