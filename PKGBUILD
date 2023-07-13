# Maintainer: Flat <flat@esoteric.moe>
pkgname=ddh-git
pkgver=r427.aac9046
pkgrel=1
pkgdesc="Manage duplicate files "
arch=('x86_64')
url="https://github.com/darakian/ddh"
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'rust')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/darakian/ddh')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}/"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	cargo build --release
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm755 target/release/${pkgname%-git} "$pkgdir/usr/bin/${pkgname%-git}"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname-git}/LICENSE"
}
