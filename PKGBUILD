# Maintainer: Roshless <pkg@roshless.com>

pkgname=fup
pkgrel=1
pkgver=4
pkgdesc="Command line client for gofu"
url="https://git.roshless.me/gofu/fup"
arch=('x86_64' 'i686')
license=("GPL")
makedepends=('go')
source=("https://git.roshless.me/gofu/$pkgname/archive/$pkgver.tar.gz")

build() {
	cd $pkgname

	go build \
	    -trimpath \
	    -buildmode=pie \
	    -mod=readonly \
	    -modcacherw \
	    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
	    .
}

package() {
	cd $pkgname
	install -Dm755 $pkgname -t "$pkgdir/usr/bin/"
	install -Dm755 dist/config.yml -t "$pkgdir/usr/share/$pkgname"
}

sha256sums=('0732641096b7b2483790b4f1dde93bf2c7a1d6f029a0396736f45f5296f8ae04')
