# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=nics
pkgver=1.7.0
pkgrel=1
pkgdesc="Display information about Network Interface Cards (NICs) cross-platform"
arch=('x86_64')
url="https://github.com/jftuga/nics"
license=('MIT')
depends=()
makedepends=('go')
_tag="v1.7.0"
_srcdir="nics-1.7.0"
source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/jftuga/nics/tar.gz/refs/tags/$_tag")
sha256sums=('97b06728111be79ce327185a5aa43f86e5a8b76118c622568df2d4cc8f60f882')
function build() {
	cd "$_srcdir"
	export CGO_ENABLED=0
	export GOFLAGS="-trimpath -mod=readonly -modcacherw"
	go build -o "$pkgname" .
}
function package() {
	cd "$_srcdir"
	install -Dm755 "nics" "$pkgdir/usr/bin/$pkgname"
	if [ -f LICENSE ]; then
		install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	fi
}
