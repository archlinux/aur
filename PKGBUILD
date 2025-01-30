# Maintainer: adamanteye <ada@adamanteye.cc> 
pkgname=tunet_bash
pkgver=1.2.3
pkgrel=1
pkgdesc="清华大学校园网准入脚本."
arch=('any')
url='https://github.com/adamanteye/tunet_bash'
license=('MIT')
depends=('bash' 'curl' 'openssl')
makedepends=('scdoc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4606472a2b8ba0fd59c06e079a77a1a03b4a9f9b1ce9803598364d9fd88331a0')
build() {
	cd "$srcdir/$pkgname-$pkgver"
	make man
}
package() {
	cd "$srcdir/$pkgname-$pkgver"
	make PREFIX="$pkgdir/usr" install > /dev/null 2>&1
	mkdir -p "$pkgdir/usr/share/man/man1"
	cp "${pkgname}.1.gz" "$pkgdir/usr/share/man/man1"
	install -Dm644 completions/tunet_bash.fish "$pkgdir/usr/share/fish/vendor_completions.d/tunet_bash.fish"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
