# Maintainer: Roshless <pkg@roshless.com>

pkgname=fup
pkgrel=1
pkgver=3
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

sha256sums=('6e49ead6ad74a83dc5f8cf14dd3e2983549306d5c05c83644f686abea1234f02')
