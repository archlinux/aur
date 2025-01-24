# Maintainer: Federico Maria Morrone <aur at morrone dot dev>

pkgname=verdi-git
pkgver=r211.5bdd3b3
pkgrel=1
pkgdesc="The elegant Wayland compositor"
arch=('x86_64' 'aarch64')
url="https://github.com/verdiwm/verdi"
license=('Apache-2.0')
groups=('verdi')
depends=('libinput')
makedepends=('git' 'cargo')
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
	cargo xtask build
}

package() {
	cd "$srcdir/${pkgname%-git}"
	cargo xtask install --destdir $pkgdir
}
