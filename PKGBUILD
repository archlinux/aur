# Maintainer: Roshless <pkg@roshless.com>

pkgname=fup
pkgrel=1
pkgver=7
pkgdesc="Command line client for gofu"
url="https://git.roshless.me/gofu/fup"
arch=('x86_64' 'i686')
license=("GPL3-or-later")
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

sha256sums=('d5033175fa33918ece2d0767bd4e4231ad4fc642247deb3f7a51724f178fe0f8')
