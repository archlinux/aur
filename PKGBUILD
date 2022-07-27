# Maintainer: kerel <kerel at mailbox dot org>

pkgname=giza-git
pkgver=r715.a6cefc4
pkgrel=1
pkgdesc="giza - a scientific plotting library for C/Fortran"
arch=('any')
url="https://github.com/danieljprice/giza"
branch="master"
license=('GPL2')
depends=()
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("giza::git+$url.git#branch=$branch")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
