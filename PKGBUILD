pkgname=dnf-plugins-extras
pkgver=0.0.9
pkgrel=1
pkgdesc="Extras DNF Plugins"
arch=('any')
url="https://github.com/rpm-software-management/$pkgname"
license=('GPL2')
depends=('dnf' 'python')
makedepends=('cmake')
checkdepends=('python-nose')
optdepends=('createrepo_c: for local plugin'
            'snapper: for snapper plugin'
            'tracer:  for tracer plugin')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgname-$pkgver-1.tar.gz")
md5sums=('44d1349a728be5d736994ffc13bbce3a')

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

# Tests seem to need a minimal RPM database on the system
#check() {
#	cd "$pkgname-$pkgname-$pkgver-1"
#	PYTHONPATH=./plugins nosetests -s tests
#}

package() {
	cd "$pkgname-$pkgname-$pkgver-1"/build
	make DESTDIR="$pkgdir/" install

	install -D -m644 ../README.rst "$pkgdir/usr/share/doc/$pkgname/README.rst"
}

# vim: set ft=sh ts=4 sw=4 noet:
