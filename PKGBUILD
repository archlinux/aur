# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=sidekick
pkgver=0.6.6
pkgrel=1
pkgdesc="Deploy apps to your own VPS over SSH with zero-downtime"
arch=('x86_64')
url="https://github.com/MightyMoud/sidekick"
license=('GPL-3.0-only')
depends=('glibc' 'openssh')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/MightyMoud/sidekick/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('174224422622158ee78d423ac3c25bb9265914983a1f9b5b2e14543dcb0fe939')

build() {
	cd "$pkgname-$pkgver"
	go build -trimpath -buildmode=pie -ldflags "-buildid= -X github.com/mightymoud/sidekick/cmd.version=v$pkgver" -o build/sidekick .
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 build/sidekick "$pkgdir/usr/bin/sidekick"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
