# Maintainer: Johannes "jo" Erwerle <jo+myping@swagspace.org>
pkgname=myping
pkgver=0.2
pkgrel=2
epoch=
pkgdesc="ping many things at once and visualize the result"
arch=("x86_64")
url="https://github.com/9er/myping"
license=('MIT')
groups=()
depends=(glibc)
makedepends=(go)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install="myping.install"
changelog=
source=("$pkgname-$pkgver.tar.gz::https://github.com/9er/myping/archive/refs/tags/v${pkgver}.tar.gz")
noextract=()
sha256sums=(SKIP)
validpgpkeys=()

build() {
	cd "$pkgname-$pkgver"

	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

	go mod tidy
	go build src/myping.go
}

package() {
	mkdir -p $pkgdir/usr/bin/
	cd "$pkgname-$pkgver"
	cp myping $pkgdir/usr/bin/myping
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
