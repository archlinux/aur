# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=konfigo
pkgver=2.0.2
pkgrel=1
pkgdesc="Work with multiple config formats: JSON, YAML, TOML"
arch=('x86_64')
url="https://github.com/ebogdum/konfigo"
license=('MIT')
depends=()
makedepends=('go')
_tag="v2.0.2"
_srcdir="konfigo-2.0.2"
source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/ebogdum/konfigo/tar.gz/refs/tags/$_tag")
sha256sums=('4bcf852ca67d22d82f2c6a8b3119100b7dfb8e20228d4104478138aab8e6cbbd')
function build() {
	cd "$_srcdir"
	export CGO_ENABLED=0
	export GOFLAGS="-trimpath -mod=readonly -modcacherw"
	go build -o "$pkgname" ./cmd/konfigo
}
function package() {
	cd "$_srcdir"
	install -Dm755 "konfigo" "$pkgdir/usr/bin/$pkgname"
	if [ -f LICENSE ]; then
		install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	fi
}
