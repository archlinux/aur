# Maintainer: Bryn Edwards <bryn.edwards@gmail.com>

pkgname=antibody
pkgver=4.2.0
pkgrel=1
pkgdesc="A shell plugin manager."
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://getantibody.github.io/"
license=('MIT')
depends=('git')
makedepends=('go')
source=("https://github.com/getantibody/antibody/archive/v${pkgver}.tar.gz")
sha256sums=('552d94e2a0e5b3b93f8659f0a9ed5bdae4622c46a2418ca2a40573862fc991dc')

prepare() {
	cd "$pkgname-$pkgver"
	sed -i "25s/dev/$pkgver/" "main.go"
}

build() {
	cd "$pkgname-$pkgver"
	go build .
}

check() {
	cd "$pkgname-$pkgver"
	make test
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
