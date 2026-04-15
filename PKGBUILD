# Maintainer: Roshless <pkg@roshless.com>

pkgname=fup
pkgrel=1
pkgver=5
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

sha256sums=('b0800f15e84676959207c4b1cac0e683553d60443b3f90bd89d4e172d14e8d96')
