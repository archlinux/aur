# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=http-tanker
pkgver=0.0.1
pkgrel=1
pkgdesc="Terminal app for API testing: create, manage and execute HTTP requests"
arch=('x86_64')
url="https://github.com/PierreKieffer/http-tanker"
license=('BSD')
depends=()
makedepends=('go')
_tag="v0.0.1"
_srcdir="http-tanker-0.0.1"
source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/PierreKieffer/http-tanker/tar.gz/refs/tags/$_tag")
sha256sums=('2bb53d2527d1e8a194cdf95601024b20046b14dfddd5bcdfbfd5702c353ec81f')
function build() {
	cd "$_srcdir"
	export CGO_ENABLED=0
	export GOFLAGS="-trimpath -mod=readonly -modcacherw"
	go build -o "$pkgname" .
}
function package() {
	cd "$_srcdir"
	install -Dm755 "http-tanker" "$pkgdir/usr/bin/$pkgname"
	if [ -f LICENSE ]; then
		install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	fi
}
