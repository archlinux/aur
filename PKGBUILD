# Maintainer: Manuel Groß <mgr@irimi.one>
pkgname=habitctl-git
pkgver=r29.77c2a92
pkgrel=2
pkgdesc="Minimalist command line tool you can use to track and examine your habits."
arch=('x86_64')
url="https://github.com/blinry/habitctl"
license=('GPL')
depends=('gcc-libs')
makedepends=('git' 'rust')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/blinry/habitctl.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	cargo build --release
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dt "$pkgdir"/usr/bin target/release/habitctl
}
