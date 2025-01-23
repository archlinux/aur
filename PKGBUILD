# Maintainer: adamanteye <ada@adamanteye.cc> 
pkgname=tunet_bash
pkgver=0.3.0
pkgrel=1
pkgdesc="清华大学校园网准入脚本."
arch=('x86_64')
url='https://github.com/adamanteye/tunet_bash'
license=('MIT')
depends=('bash' 'glibc' 'gcc-libs' 'curl' 'openssl')
makedepends=('scdoc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('15d6cbbb564f31108c524e84b4fb8264913a9dacdfde67290235c57ff3969eaf')
build() {
	cd "$srcdir/$pkgname-$pkgver"
	make CXX=g++
	make man
}
package() {
	cd "$srcdir/$pkgname-$pkgver"
	make PREFIX="$pkgdir/usr" install > /dev/null 2>&1
	mkdir -p "$pkgdir/usr/share/man/man1"
	cp "${pkgname}.1.gz" "$pkgdir/usr/share/man/man1"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
