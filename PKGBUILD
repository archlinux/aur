# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=dockdu
pkgver=0.5.0
pkgrel=1
_repo=dockdu
_tag=v0.5.0
_srcdir="$_repo-$pkgver"
pkgdesc="Read-only report of where Docker disk space went: container log files, build cache shared with images and storage per Compose project"
arch=('x86_64')
url="https://github.com/maximilianfeix/dockdu"
license=('MIT')
depends=('glibc' 'docker')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/maximilianfeix/dockdu/archive/refs/tags/$_tag.tar.gz")
sha256sums=('665c4ed0a8c5448bc34b3e5889e2318e0c4b4484ac694ae3082e74950e120078')

build() {
	cd "$_srcdir"
	go build -trimpath -buildmode=pie -ldflags "-buildid=" -o build/dockdu ./cmd/dockdu
}

check() {
	cd "$_srcdir"
	go test ./internal/...
}

package() {
	cd "$_srcdir"
	install -Dm755 build/dockdu "$pkgdir/usr/bin/dockdu"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
