# Maintainer: adamanteye <ada@adamanteye.cc> 
pkgname=tunet_bash
pkgver=1.2.4
pkgrel=1
pkgdesc="清华大学校园网准入脚本."
arch=('any')
url='https://github.com/adamanteye/tunet_bash'
license=('MIT')
depends=('bash' 'curl' 'openssl')
makedepends=('scdoc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('76783103c30dc16a0cbba5c032655794d86a3e004fbf7e2d00b0b54a365dcfea')
build() {
	cd "$srcdir/$pkgname-$pkgver"
	make man
}
package() {
	cd "$srcdir/$pkgname-$pkgver"
	make PREFIX="$pkgdir/usr" install > /dev/null 2>&1
	mkdir -p "$pkgdir/usr/share/man/man1"
	install -Dm644 "${pkgname}.1.gz" "$pkgdir/usr/share/man/man1/${pkgname}.1.gz"
	install -Dm644 completions/tunet_bash.fish "$pkgdir/usr/share/fish/vendor_completions.d/tunet_bash.fish"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
