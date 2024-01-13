# Maintainer: Jeremy Gust <jeremy AT plasticsoup DOT net>
# Contributor: Jameson Pugh <imntreal@gmail.com>
pkgname=moar
pkgver=1.22.3
pkgrel=1
pkgdesc="A pager designed to just do the right thing without any configuration."
arch=(x86_64)
url="https://github.com/walles/moar"
license=(BSD)
makedepends=(go)
source=("$pkgname-$pkgver.tar.gz"::"$url/archive/v$pkgver.tar.gz")
sha256sums=('8134505c476b6265adcd34d3423cf60c69716c46c63a49e5600e77105c2ffb97')

build() {
	cd "$pkgname-$pkgver"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -ldflags="-X main.versionString=$pkgver" -o "$pkgname"
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 moar "$pkgdir/usr/bin/$pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 moar.1 "$pkgdir/usr/share/man/man1/$pkgname.1"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
