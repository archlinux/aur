# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=treeport
pkgver=0.1.3
pkgrel=1
_repo=treeport
_tag=v0.1.3
_srcdir="$_repo-$pkgver"
pkgdesc="Read-only filename portability checks for directories, JSONL manifests, and ZIP entries; reports destination name collisions and path-length violations"
arch=('x86_64')
url="https://github.com/rad1092/treeport"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rad1092/treeport/archive/refs/tags/$_tag.tar.gz")
sha256sums=('a6d4859130775e1ecff520863e328b99fb93034cab12f40922411d07aa1165b7')

build() {
	cd "$_srcdir"
	go build -trimpath -buildmode=pie -ldflags "-buildid=" -o build/treeport ./cmd/treeport
}

check() {
	cd "$_srcdir"
	go test ./...
}

package() {
	cd "$_srcdir"
	install -Dm755 build/treeport "$pkgdir/usr/bin/treeport"
	install -Dm644 "$srcdir/$_srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
