# Maintainer: Abhinav Gupta <mail@abhinavg.net>
pkgname=tmux-fastcopy
pkgver=0.11.1
pkgrel=1
pkgdesc='easymotion-style text copying for tmux.'
arch=(any)
url="https://github.com/abhinav/tmux-fastcopy"
license=('GPL-2.0')
depends=('tmux')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('dc78dc94da218a328ef7c71d204cef7c5760db539810481595cb808a29a2e273')

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
