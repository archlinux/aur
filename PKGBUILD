# Maintainer: Federico Serra <fedeztk at tutanota dot com>

pkgname=go-translation-git
_name=got
pkgver=r60.0a877bb
pkgrel=1
pkgdesc="Translating TUI written in go using simplytranslate's API"
arch=('any')
url="https://github.com/fedeztk/got"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
provides=('got')
conflicts=('got')
source=('git+https://github.com/fedeztk/got.git')
sha256sums=('SKIP')

build() {
	cd "$_name"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -o got ./cmd/got/main.go
}

package() {
	cd "$_name"
	install -Dm755 got "$pkgdir/usr/bin/got"
	install -Dm644 license "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
