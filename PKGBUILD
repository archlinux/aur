# Maintainer: adamanteye <ada@adamanteye.cc> 
pkgname=tunet_bash
pkgver=1.2.5
pkgrel=1
pkgdesc="清华大学校园网准入脚本."
arch=('any')
url='https://github.com/adamanteye/tunet_bash'
license=('MIT')
depends=('bash' 'curl' 'openssl')
optdepends=('pass: for password storing')
makedepends=('scdoc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0a055d8dcd2304804c7b8f0f3985792c4a6c435b9284c0d4e97264624c3bc78c')
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
