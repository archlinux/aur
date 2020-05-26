# Maintainer: Jonas 'cherti' Große Sundrup <aur@letopolis.de>

pkgname=typemute
pkgver=0.3
pkgrel=1
pkgdesc='Mute yourself while typing'
arch=(i686 x86_64)
url='https://github.com/cherti/typemute'
license=('GPLv3')
depends=('sudo' 'expect' 'libinput' 'libpulse')
makedepends=('go')
source=('https://github.com/cherti/typemute/archive/v0.3.tar.gz')
sha256sums=('71417de4088f5ce1c56f476e582698a0a77ec7f80cdfd0b6e799c20712ac29ba')

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
