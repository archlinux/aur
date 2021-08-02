# Maintainer: eNV25 <env252525@gmail.com>

pkgname=keyd-git
pkgver=r25.c51fb41
pkgrel=1
arch=(x86_64)
pkgdesc="A key remapping daemon for linux. "
url="https://github.com/rvaiya/keyd"
license=('MIT')
depends=('libudev.so')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/rvaiya/keyd.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="${pkgdir}" PREFIX='/usr' install
}
