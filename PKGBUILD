# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=planor
pkgver=0.5.1
pkgrel=1
pkgdesc="The Cloud Aviator: TUI client for cloud services (AWS, Vultr, Heroku, Render.com, Fleek, ...)"
arch=('x86_64' 'aarch64')
url="https://github.com/mrusme/planor"
license=('GPL-3.0-only')
depends=()
makedepends=('go>=1.18')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('504a4d5e3f5562e5950ccc8bec334f774778c0642298945082157f1a623f0a8c')

prepare() {
	cd "$pkgname-$pkgver"
	go mod download
}

build() {
	cd "$pkgname-$pkgver"
	export CGO_ENABLED=0
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	go build -ldflags "-s -w" -o "planor" .
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "planor" "$pkgdir/usr/bin/planor"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
