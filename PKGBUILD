# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=portfinder
pkgver=0.2.1
pkgrel=1
pkgdesc="Identify and manage processes using network ports, with project awareness"
arch=('x86_64')
url="https://github.com/doganarif/portfinder"
license=('MIT')
depends=()
makedepends=('go')
_tag="v0.2.1"
_srcdir="portfinder-0.2.1"
source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/doganarif/portfinder/tar.gz/refs/tags/$_tag")
sha256sums=('def1e41bee05ac806211c8891c92b02409164626809446b951e58264dd4aa063')
function build() {
	cd "$_srcdir"
	export CGO_ENABLED=0
	export GOFLAGS="-trimpath -mod=readonly -modcacherw"
	go build -o "$pkgname" ./cmd/portfinder
}
function package() {
	cd "$_srcdir"
	install -Dm755 "portfinder" "$pkgdir/usr/bin/$pkgname"
	if [ -f LICENSE ]; then
		install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	fi
}
