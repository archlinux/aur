# Maintainer: Abhinav Gupta <mail@abhinavg.net>
pkgname=tmux-fastcopy
pkgver=0.7.1
pkgrel=1
pkgdesc='easymotion-style text copying for tmux.'
arch=(any)
url="https://github.com/abhinav/tmux-fastcopy"
license=('MIT')
depends=('tmux')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('0842734f35549a2e53f325d15e55b31be77d3d66fa39e01dd08f1709793643c7')

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
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/tmux-fastcopy/LICENSE"
}
