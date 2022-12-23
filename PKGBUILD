# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
pkgname=qb64
pkgver=2.0.2
pkgrel=2
pkgdesc='BASIC for the modern era'
arch=('x86_64')
url='https://www.qb64.org/'
license=('custom')
makedepends=('gcc' 'zlib' 'xorg-xmessage')
options=('!strip')
install=qb64.install
source=("https://github.com/QB64Team/qb64/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ba4ce7a7a7574ff065707f85c8d5cb741063eae7f7b7e55eb79f9037f300e991')

prepare() {
	cd "$pkgname-$pkgver"
	sed -i 's!~/.local/share/applications/!!' setup_lnx.sh
	sed -i 's!$_pwd!/opt/qb64!' setup_lnx.sh
	sed -i 's!  ./qb64 &!  #./qb64 &!' setup_lnx.sh
}

build() {
	cd "$pkgname-$pkgver"
	./setup_lnx.sh
}

package() {
	cd "$pkgname-$pkgver"
	mkdir -p "$pkgdir/opt/qb64"
	cp -r internal licenses COPYING.txt qb64 qb64.1 run_qb64.sh "$pkgdir/opt/qb64"
	chmod -R g+w "$pkgdir/opt/qb64/internal"
	install -Dm644 qb64.desktop "$pkgdir/usr/share/applications/qb64.desktop"
	install -Dm644 COPYING.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
