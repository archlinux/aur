# Maintainer: Abhinav Gupta <mail@abhinavg.net>
pkgname=tmux-fastcopy
pkgver=0.6.1
pkgrel=1
pkgdesc='easymotion-style text copying for tmux.'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/abhinav/tmux-fastcopy"
license=('MIT')
depends=('tmux')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('4d45899157c3353f8bab5f560de5a79fad25a34c0be1b7d983c01eae424cbc24')

_gopackagepath=github.com/abhinav/tmux-fastcopy

build() {
	cd "$pkgname-$pkgver"
	export CGO_ENABLED=0
	go build \
		-trimpath \
		-buildmode=pie \
		-mod=readonly \
		-modcacherw \
		-ldflags "-s -w -X main._version=$pkgver" \
		-o "$pkgname" "$_gopackagepath"
}

check() {
	cd "$pkgname-$pkgver"
	"./$pkgname" -version
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
