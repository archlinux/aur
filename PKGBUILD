# Maintainer: Kusoneko <kusoneko@kusoneko.moe>

pkgname=catgirl-git
pkgver=2.1.r1032.4961fdf
pkgrel=1
pkgdesc="TLS-only terminal IRC client"
arch=('x86_64')
url="https://git.causal.agency/catgirl"
license=('GPL3')
makedepends=('git')
depends=('libretls' 'ncurses')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://git.causal.agency/${pkgname%-git}.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "%s.r%s.%s" "$(git describe --tags --abbrev=0)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	./configure --prefix=/usr --mandir=/usr/share/man
	make all
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
