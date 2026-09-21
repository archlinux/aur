# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=ll
pkgver=1.0.0
pkgrel=1
pkgdesc="ls with git status"
arch=('x86_64')
url="https://github.com/antonmedv/ll"
license=('unknown')
depends=()
makedepends=('go')
_tag="1.0.0"
_srcdir="ll-1.0.0"
source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/antonmedv/ll/tar.gz/refs/tags/$_tag")
sha256sums=('cf8f7ab836f5a7071c80dd37d3a1fbc3c23162167624cd0f160f89ec9535d4a6')
function build() {
	cd "$_srcdir"
	export CGO_ENABLED=0
	export GOFLAGS="-trimpath -mod=readonly -modcacherw"
	go build -o "$pkgname" .
}
function package() {
	cd "$_srcdir"
	install -Dm755 "ll" "$pkgdir/usr/bin/$pkgname"
	if [ -f LICENSE ]; then
		install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	fi
}
