# Maintainer: Federico Maria Morrone <aur at morrone dot dev>

pkgname=verdi-git
pkgver=r168.b2cd848
pkgrel=1
pkgdesc="The elegant Wayland compositor"
arch=('x86_64' 'aarch64')
url="https://github.com/verdiwm/verdi"
license=('Apache-2.0')
groups=('verdi')
depends=('libinput')
makedepends=('git' 'cargo' 'just')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/verdiwm/verdi.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	just build
}

package() {
	cd "$srcdir/${pkgname%-git}"
	just DESTDIR="$pkgdir/" install
}
