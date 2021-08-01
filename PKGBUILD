# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=nasc
pkgver=0.7.7
_qalculate_ver=ad985fd77acfd54ee369d56f6066b1460b973cdb
pkgrel=1
pkgdesc='Do maths like a normal person.'
arch=(i686 x86_64)
url=https://parnold-x.github.io/nasc/
license=(GPL3)
depends=(granite gtksourceview3 mpfr webkit2gtk)
optdepends=()
makedepends=(vala git meson intltool)
conflicts=(nasc-git nasc-bzr)
source=("$pkgname-$pkgver.tar.gz::https://github.com/parnold-x/nasc/archive/$pkgver.tar.gz"
		"libqalculate-$_qalculate_ver::git+https://github.com/parnold-x/libqalculate#commit=$_qalculate_ver")
sha512sums=('88fcfb542cb2138ff7138a9411225e7e8c486bd1e11e4caba58af817541cd0a0d9f5ffd63f8ee8199e9318dd7772f19991dda2194f76c866b022781a56a34f5b'
            'SKIP')

prepare () {
	cd "$pkgname-$pkgver/subprojects"
	rm -rf libqalculate
	ln -vsnf "../../libqalculate-$_qalculate_ver" libqalculate
}

build () {
	rm -rf build
	arch-meson build "$pkgname-$pkgver"
	meson compile -C build
}

check () {
	meson test -C build
}

package () {
	meson install -C build --destdir="$pkgdir"
}
