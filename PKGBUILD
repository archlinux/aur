pkgname=dnf-plugins-core
pkgver=0.1.9
pkgrel=1
pkgdesc="Core DNF Plugins"
arch=('any')
url="https://github.com/rpm-software-management/$pkgname"
license=('GPL2')
depends=('dnf' 'python')
makedepends=('cmake')
checkdepends=('python-nose')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgname-$pkgver-1.tar.gz")
md5sums=('b6cab618273e323110d582d64836c43a')

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
