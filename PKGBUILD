# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-smda
pkgver=1.6.2
pkgrel=1
pkgdesc="Recursive diassembler optimized for CFG recovery from memory dumps"
arch=('any')
url="https://github.com/danielplohmann/smda"
license=('BSD')
depends=('python-capstone' 'python-lief')
makedepends=('python-setuptools')
checkdepends=()
changelog=
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/s/smda/smda-$pkgver.tar.gz"
        '001-setup.py.patch')
sha256sums=('902aa793dc9de181fffdd8cb2745c7ce28e9722bd3431f1150ebe5fd0856b398'
            'f5da41c9d55e98e61a84cc87ab7638a92d07ed1a3a08e3491a2ca5f41cc5f36e')

prepare() {
	patch -p1 -d "smda-$pkgver" setup.py < 001-setup.py.patch
}

build() {
	cd "smda-$pkgver"
	python setup.py build
}

check() {
	cd "smda-$pkgver"
}

package() {
	export PYTHONHASHSEED=0
	cd "smda-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
