# Maintainer: adamanteye <ada@adamanteye.cc> 
pkgname=tunet_bash
pkgver=1.0.1
pkgrel=1
pkgdesc="清华大学校园网准入脚本."
arch=('any')
url='https://github.com/adamanteye/tunet_bash'
license=('MIT')
depends=('bash' 'curl' 'openssl')
makedepends=('scdoc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4777edc0199c00a165a080290e704d4ad45e47a3897ee9c8f7a5d5a6c017025b')
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
