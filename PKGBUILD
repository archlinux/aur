# Maintainer: kerel <kerel at mailbox dot org>

pkgname=giza-git
pkgver=r751.72d3703
pkgrel=1
pkgdesc="giza - a scientific plotting library for C/Fortran"
arch=('x86_64')
url="https://github.com/danieljprice/giza"
branch="master"
license=('LGPL-3.0-or-later')
depends=()
makedepends=('git' 'gcc-fortran')
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
