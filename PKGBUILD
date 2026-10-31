# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=drainready
pkgver=0.2.0
pkgrel=1
_repo=drainready
_tag=v0.2.0
_srcdir="$_repo-$pkgver"
pkgdesc="Predicts whether kubectl drain will finish on a node by checking PodDisruptionBudgets before you cordon; names the blocking budget and why"
arch=('x86_64')
url="https://blackman99.github.io/drainready/"
license=('MIT')
depends=('glibc' 'kubectl')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Blackman99/drainready/archive/refs/tags/$_tag.tar.gz")
sha256sums=('c2f5f246eeca5d93cdcd45120a80a746f97a4f9e956ae22a67458c2e71b85173')

build() {
	cd "$_srcdir"
	go build -trimpath -buildmode=pie -ldflags "-buildid=" -o build/drainready ./cmd/drainready
}

check() {
	cd "$_srcdir"
	go test ./...
}

package() {
	cd "$_srcdir"
	install -Dm755 build/drainready "$pkgdir/usr/bin/drainready"
	install -Dm644 "$srcdir/$_srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
