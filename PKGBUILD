# Maintainer: Roshless <pkg@roshless.com>

pkgname=fup
pkgrel=1
pkgver=2
pkgdesc="Command line client for gofu"
url="https://git.roshless.me/gofu/fup"
arch=('x86_64' 'i686')
license=("GPL")
makedepends=('go')
source=("https://git.roshless.me/gofu/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")

build() {
	cd $pkgname-$pkgver

	go build \
	    -trimpath \
	    -buildmode=pie \
	    -mod=readonly \
	    -modcacherw \
	    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
	    .
}

package() {
	cd $pkgname-$pkgver
	install -Dm755 $pkgname -t "$pkgdir/usr/bin/"
	install -Dm755 dist/config.yml -t "$pkgdir/usr/share/$pkgname"
}

sha256sums=('b00047073ed054698a4e88c5433896445967d08847b22b0c8cefec55d8172f4b')
