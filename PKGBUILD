# Maintainer: Jonas 'cherti' Große Sundrup <aur@letopolis.de>

pkgname=typemute
pkgver=0.4
pkgrel=1
pkgdesc='Mute yourself while typing'
arch=(i686 x86_64)
url='https://github.com/cherti/typemute'
license=('GPLv3')
depends=('sudo' 'expect' 'libinput' 'pulseaudio')
makedepends=('go')
source=('https://github.com/cherti/typemute/archive/v0.4.tar.gz')
sha256sums=('b84b2f39ffa338c737e847d948a4d7ed79a6e058acccbe19286188216d7e985e')

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
