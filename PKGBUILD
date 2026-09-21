# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=gust
pkgver=0.2.0
pkgrel=1
pkgdesc="Command line weather app written in Go"
arch=('x86_64')
url="https://github.com/josephburgess/gust"
license=('unknown')
depends=()
makedepends=('go')
_tag="v0.2.0"
_srcdir="gust-0.2.0"
source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/josephburgess/gust/tar.gz/refs/tags/$_tag")
sha256sums=('44335cabae07184c65d6d8402cc4a22401512ec3abe0bbb93fd594aded1504b4')
function build() {
	cd "$_srcdir"
	export CGO_ENABLED=0
	export GOFLAGS="-trimpath -mod=readonly -modcacherw"
	go build -o "$pkgname" ./cmd/gust
}
function package() {
	cd "$_srcdir"
	install -Dm755 "gust" "$pkgdir/usr/bin/$pkgname"
	if [ -f LICENSE ]; then
		install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	fi
}
