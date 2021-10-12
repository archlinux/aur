# Maintainer: scrouthtv <scrouthtv 0x40 gmail 0x2e com>
pkgname=gosc
pkgver=1.2
pkgrel=1
pkgdesc="Cross platform text based spreadsheet calculator written in Go."
license=('BSD')
url="https://github.com/scrouthtv/gosc"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
depends=('glibc')
makedepends=('go')
optdepends=()
conflicts=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=("56e08856da76f3d24cca8d557fe382622eff380c81c6546d952152db86070d09bb9d5d5b72cc211e4b982fab746ffa887234b5c377d5dea0ae6177c1f29a3c8a")

build() {
  cd "$pkgname-$pkgver"

	export CGO_CPPFLAGS="${CPPFLAGS} -D_FORTIFY_SOURCE=2"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS} -Wl,-z,relro,-z,now"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	export CGO_ENABLED=1

  go build .
}

package() {
	cd "$pkgname-$pkgver"

	# binary:
  install -Dm755 "gosc" "$pkgdir/usr/bin/gosc"
}
