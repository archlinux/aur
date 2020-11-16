# Maintainer: x2b <psaoj.10.Toranaga-San@spamgourmet.com>

pkgname=adol-c-git
_pkgname=ADOL-C
pkgver=r565.e1fe4761
pkgrel=1
pkgdesc="ADOL-C automatic differentiation library"
arch=("x86_64")
url="https://github.com/coin-or/ADOL-C"
license=('EPL')
depends=("colpack" "boost-libs")
makedepends=("git")
provides=("adol-c")
conflicts=("adol-c")
source=("git+https://github.com/coin-or/ADOL-C")
sha1sums=("SKIP")

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_pkgname}"
	./configure --prefix=/usr --libdir=/usr/lib
	make
}

check() {
	cd "${srcdir}/${_pkgname}"
	make -k check
}

package() {
	cd "${srcdir}/${_pkgname}"
	make DESTDIR="$pkgdir/" install
}
