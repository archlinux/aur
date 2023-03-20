# Maintainer: Kusoneko <kusoneko@kusoneko.moe>

pkgname=scooper-git
pkgver=1.3.r118.992e373
pkgrel=1
pkgdesc="CGI and FastCGI web interface for litterbox IRC logger"
arch=('x86_64')
url="https://git.causal.agency/scooper"
license=('GPL3')
makedepends=('git')
depends=('kcgi')
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
