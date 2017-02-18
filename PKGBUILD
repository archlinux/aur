# Maintainer: Simon Wilper <sxw@chronowerks.de>

pkgname=cutelyst
pkgver=1.4.0
pkgrel=1
pkgdesc="A Web Framework built on top of Qt, using the simple approach of Catalyst (Perl) framework."
arch=('i686' 'x86_64')
url="http://cutelyst.org"
license=('LGPL2.1')
depends=('qt5-base' 'uwsgi')
makedepends=('cmake')
source=("https://github.com/cutelyst/cutelyst/archive/r${pkgver}.tar.gz")
md5sums=('327a9cb263ad5a41e5d920b660e508b3')

build() {
	mkdir -p "$srcdir/${pkgname}-r${pkgver}/build"
	cd "$srcdir/${pkgname}-r${pkgver}"

  # uwsgi expects plugins under lib/uwsgi not lib/uwsgi/plugins
  sed -i.orig -E -e 's@(UWSGI_PLUGINS_DIR) ".+?" (.+)$@\1 "/usr/lib/uwsgi" \2@' CMakeLists.txt

	cd build
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ".."
	make
}

package() {
	cd "$srcdir/${pkgname}-r${pkgver}/build"
	make DESTDIR="$pkgdir/" install
}
