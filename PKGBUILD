# Maintainer: Jonas 'cherti' Große Sundrup <aur@letopolis.de>

pkgname=typemute
pkgver=0.1
pkgrel=2
pkgdesc='Mute yourself while typing'
arch=(i686 x86_64)
url='https://github.com/cherti/typemute'
license=('GPLv3')
depends=('sudo' 'expect' 'libinput')
makedepends=('go')
source=('https://github.com/cherti/typemute/archive/v0.1.tar.gz')
sha256sums=('490c70405876dc5b92e9a8498bc53a2093a75903054a40260ce49366ecb7f27f')

build() {
	cd "$pkgname-$pkgver"
	export CGO_LDFLAGS="${LDFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	GOPATH=$(pwd)
	go get -u "github.com/sqp/pulseaudio"
	go build typemute.go
}

package() {
	mkdir -p "$pkgdir/usr/bin"
	install -p -m755 "$srcdir/$pkgname-$pkgver/typemute" "$pkgdir/usr/bin"
}
