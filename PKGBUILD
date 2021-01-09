# Maintainer: Pierre Mavro <deimosfr@gmail.com>
pkgname=oled-backlight
pkgver=0.4
pkgrel=1
pkgdesc="CLI tool to Manage OLED backlight brightness"
arch=(x86_64)
url="https://github.com/deimosfr/oled-backlight"
license=('GPL')
makedepends=(git go)
source=("https://github.com/deimosfr/oled-backlight/archive/v$pkgver.tar.gz")

build() {
	cd "$pkgname-$pkgver"
    export CGO_LDFLAGS="${LDFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    go build -o oled-backlight oled-backlight.go
}

package() {
	cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
md5sums=('7589cb4e7c0ed6434e9bcd60651fdf25')
