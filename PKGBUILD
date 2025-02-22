# Maintainer: Matilde Morrone <aur at morrone dot dev>

pkgname=padfolio-git
pkgver=r7.56b5ccb
pkgrel=1
pkgdesc="Minimal Wayland clipboard manager"
arch=('x86_64' 'aarch64')
url="https://github.com/verdiwm/padfolio"
license=('Apache-2.0')
makedepends=('git' 'cargo' 'just')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/verdiwm/padfolio.git')
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
