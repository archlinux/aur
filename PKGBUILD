# Maintainer: Abhinav Gupta <mail@abhinavg.net>
pkgname=tmux-fastcopy
pkgver=0.14.0
pkgrel=1
pkgdesc='easymotion-style text copying for tmux.'
arch=(any)
url="https://github.com/abhinav/tmux-fastcopy"
license=('GPL-2.0')
depends=('tmux')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('2dcbe4fd01e032f09cbbe9e3aa539a6b1fe6e8983ad26fbed8323eeab55b41dc')

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
	install -Dm644 "./LICENSE" "${pkgdir}/usr/share/licenses/tmux-fastcopy/LICENSE"
	install -Dm644 "./README.md" "${pkgdir}/usr/share/doc/tmux-fastcopy/README.md"
	install -Dm644 "./CHANGELOG.md" "${pkgdir}/usr/share/doc/tmux-fastcopy/CHANGELOG.md"
}
