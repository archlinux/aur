pkgname=dnf-plugins-core
pkgver=0.1.8
pkgrel=1
pkgdesc="Core DNF Plugins"
arch=('any')
url="https://github.com/rpm-software-management/$pkgname"
license=('GPL2')
depends=('dnf' 'python')
makedepends=('cmake')
checkdepends=('python-nose')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgname-$pkgver-1.tar.gz")
md5sums=('1d2b27bdc7f787229f0535a12901bb26')

prepare() {
	cd "$pkgname-$pkgname-$pkgver-1"
	rm -rf build
	mkdir build
}

build() {
	cd "$pkgname-$pkgname-$pkgver-1"/build
	cmake -DCMAKE_BUILD_TYPE=Release  \
	      -DCMAKE_INSTALL_PREFIX=/usr \
	      -DPYTHON_DESIRED=3          \
	      ..
	make
}

check() {
	cd "$pkgname-$pkgname-$pkgver-1"
	PYTHONPATH=./plugins nosetests -s tests
}

package() {
	cd "$pkgname-$pkgname-$pkgver-1"/build
	make DESTDIR="$pkgdir/" install

	install -D -m644 ../README.rst "$pkgdir/usr/share/doc/$pkgname/README.rst"
}

# vim: set ft=sh ts=4 sw=4 noet:
