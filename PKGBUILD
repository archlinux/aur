# Maintainer: Roshless <pkg@roshless.com>

pkgname=fup
pkgrel=1
pkgver=4
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

sha256sums=('4c817969c0884756c5c9d710dccd01f9af07c01f8b7ea869c2ffcbc53c7c9649')
