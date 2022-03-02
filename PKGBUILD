# Maintainer: eggix <eggix[at]protonmail.com>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Vitaliy Berdinskikh ur6lad[at]i.ua

pkgname=xnec2c-git
pkgver=4.4.6.r0.gef6f187
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
	make
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir" install

  # fix absolute link
  unlink "$pkgdir/usr/share/$_basename/doc"
}

