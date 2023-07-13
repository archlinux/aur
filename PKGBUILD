# Maintainer: Flat <flat@imo.uto.moe>
pkgname=rsget-git
pkgver=r198.a85773e
pkgrel=1
pkgdesc="A download tool for streams on websites."
arch=('x86_64')
url="https://github.com/Erk-/rsget"
license=('ISC')
depends=('openssl')
makedepends=('git' 'rust')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/Erk-/rsget')
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
