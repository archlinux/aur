# Maintainer: grzegorz225 <gorbak25@gmail.com>
pkgname=gtkmm3-plplot-git
pkgver=r199.gtkmm_plplot_2.2_1_g617582a
pkgrel=1
pkgdesc="A scientific plotting library for Gtkmm."
arch=('any')
url="https://tschoonj.github.io/gtkmm-plplot/index.html"
license=('(L)GPL3')
depends=('gtkmm3' 'plplot')
makedepends=('git' 'autoconf' 'automake' 'libtool' 'mm-common' 'gcc')
optdepends=('boost')
conflicts=('gtkmm3-plplot')
source=("$pkgname"::'git+https://github.com/tschoonj/gtkmm-plplot.git' 'LICENSE')
sha256sums=('SKIP' 'da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768')

pkgver() {
	cd "$srcdir/$pkgname"
	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git describe --always | tr - '_')"
}

build() {
	cd "$srcdir/$pkgname"
	autoreconf -i
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir/" install
}
