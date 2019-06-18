# Maintainer: Bryn Edwards <bryn.edwards@gmail.com>

pkgname=antibody
pkgver=4.1.2
pkgrel=1
pkgdesc="A shell plugin manager."
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://getantibody.github.io/"
license=('MIT')
depends=('git')
makedepends=('go')
source=("https://github.com/getantibody/antibody/archive/v${pkgver}.tar.gz")
sha256sums=('79e857c79cf51bff0bf42ef970a31341445911dc19cf24efb8faa01584855905')

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
