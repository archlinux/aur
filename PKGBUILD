# Maintainer: eggix <eggix[at]protonmail.com>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Vitaliy Berdinskikh ur6lad[at]i.ua

pkgname=xnec2c-git
pkgver=4.4.12.r25.g69f9d0a
pkgrel=1
pkgdesc="GTK+ Antenna EM Modeling Client"
arch=('i686' 'x86_64')
url="https://www.xnec2c.org/"
license=('GPL')
depends=('gtk3')
makedepends=('git')
optdepends=('gnuplot: to use plotted output/data files'
            'lapacke: LAPACK+BLAS support')
provides=('xnec2c')
conflicts=('xnec2c')
_basename=${pkgname%-git}
source=("$pkgname::git+https://github.com/KJ7LNW/xnec2c.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$pkgname"
	./autogen.sh
	./configure --prefix=/usr
	make desktop-install
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir" install
}

