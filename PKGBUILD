# Maintainer: Matilde Morrone <aur at morrone dot dev>

pkgname=hwfetch-git
pkgver=r23.e02d38d
pkgrel=1
pkgdesc="A really bad hardware fetch"
arch=('x86_64' 'aarch64')
url="https://github.com/morr0ne/hwfetch"
license=('Apache-2.0')
makedepends=('git' 'cargo' 'just')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/morr0ne/hwfetch.git')
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
