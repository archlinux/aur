# Maintainer: adamanteye <ada@adamanteye.cc> 
pkgname=tunet_bash
pkgver=1.2.1
pkgrel=1
pkgdesc="清华大学校园网准入脚本."
arch=('any')
url='https://github.com/adamanteye/tunet_bash'
license=('MIT')
depends=('bash' 'curl' 'openssl')
makedepends=('scdoc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ac59f8e587317b788ede9fc4c7fb40c073621c6706768b787a0ef046f4e1e591')
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
