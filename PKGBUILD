# Maintainer: Jonas 'cherti' Große Sundrup <aur@letopolis.de>

pkgname=socket-activate
pkgver=0.1
pkgrel=2
pkgdesc='activate arbitrary services via systemd socket activation'
arch=(x86_64)
url='https://github.com/cherti/socket-activate'
license=('GPLv3')
makedepends=('go')
source=('https://github.com/cherti/socket-activate/archive/v0.1.tar.gz')
sha256sums=('3a1eb8e7f0319a6cc22b7ac83e655f2acb5150428eab240497983293e4722591')

build() {
	cd "$pkgname-$pkgver"
	export CGO_LDFLAGS="${LDFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	GOPATH=$(pwd)
	go get -u "github.com/godbus/dbus"
	go build socket-activate.go
}

package() {
	mkdir -p "$pkgdir/usr/bin"
	install -p -m755 "$srcdir/$pkgname-$pkgver/socket-activate" "$pkgdir/usr/bin"
}
