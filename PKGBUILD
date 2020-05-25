# Maintainer: Jonas 'cherti' Große Sundrup <aur@letopolis.de>

pkgname=typemute
pkgver=0.2
pkgrel=2
pkgdesc='Mute yourself while typing'
arch=(i686 x86_64)
url='https://github.com/cherti/typemute'
license=('GPLv3')
depends=('sudo' 'expect' 'libinput' 'libpulse')
makedepends=('go')
source=('https://github.com/cherti/typemute/archive/v0.2.tar.gz')
sha256sums=('3c127424452388c92a05bab2327f17b02d7471df8624910a120637b7d92a73af')

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
