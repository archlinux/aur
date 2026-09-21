# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=sasqwatch
pkgver=0.2.5
pkgrel=1
pkgdesc="A modern take on the classic watch command"
arch=('x86_64')
url="https://github.com/fabio42/sasqwatch"
license=('MIT')
depends=()
makedepends=('go')
_tag="v0.2.5"
_srcdir="sasqwatch-0.2.5"
source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/fabio42/sasqwatch/tar.gz/refs/tags/$_tag")
sha256sums=('5fdd2d91857adc2ae2ffa34adfafff7d4f23977d0045809e7d3a7ff01e610bb6')
function build() {
	cd "$_srcdir"
	export CGO_ENABLED=0
	export GOFLAGS="-trimpath -mod=readonly -modcacherw"
	go build -o "$pkgname" .
}
function package() {
	cd "$_srcdir"
	install -Dm755 "sasqwatch" "$pkgdir/usr/bin/$pkgname"
	if [ -f LICENSE ]; then
		install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	fi
}
