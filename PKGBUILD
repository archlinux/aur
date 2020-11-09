# Maintainer: Celti Burroughs <celti@celti.name>
pkgname=inputplug
pkgver=0.3
pkgrel=1
pkgdesc="Xinput hotplug event daemon"
arch=('x86_64')
url="https://github.com/andrewshadura/inputplug"
license=('MIT')
depends=('libxcb')
makedepends=('libxi' 'libxfixes')
source=("$pkgname-$pkgver.tar.gz::https://github.com/andrewshadura/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('acac8e3972f3f10f9b6791321d2441e6b54d93d97c2de81e13eb14734a635ef7')

prepare() {
	cd "$pkgname-$pkgver"
	sed -i 's/CFLAGS =/CFLAGS +=/' GNUmakefile
}

build() {
	cd "$pkgname-$pkgver"
	make -f GNUmakefile
	gzip inputplug.1
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 inputplug.1.gz "$pkgdir/usr/share/man/man1/inputplug.1.gz"
	install -Dm755 inputplug "$pkgdir/usr/bin/inputplug"
}
