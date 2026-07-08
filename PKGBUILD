# Maintainer: 9M2PJU <9m2pju@hamradio.my>
# Contributor: eggix <eggix[at]protonmail.com>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Vitaliy Berdinskikh ur6lad[at]i.ua

pkgname=xnec2c-9m2pju-git
_basename=xnec2c
pkgver=4.4.18.r780.g4d9fbe4
pkgrel=1
pkgdesc="GTK+ Antenna EM Modeling Client (9M2PJU fork)"
arch=('i686' 'x86_64')
url="https://github.com/9M2PJU/xnec2c"
license=('GPL3')
depends=('gtk3' 'gsl' 'libepoxy')
makedepends=('git' 'autoconf' 'automake' 'libtool' 'gettext' 'pkgconf')
optdepends=('gnuplot: to use plotted output/data files'
            'openblas: accelerated BLAS/LAPACK linear algebra'
            'lapacke: LAPACK+BLAS support')
provides=('xnec2c')
conflicts=('xnec2c' 'xnec2c-git')
source=("$pkgname::git+https://github.com/9M2PJU/xnec2c.git")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	_ver="$(grep -m1 'AC_INIT' configure.ac | sed 's/.*\[\([0-9.]*\)\].*/\1/')"
	printf "%s.r%s.g%s" "$_ver" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$pkgname"
	./autogen.sh
	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname"
	make check
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir" install
}
