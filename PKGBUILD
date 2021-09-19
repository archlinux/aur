# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=python-binary
pkgver=1.0.0
pkgrel=4
pkgdesc="Easily convert between binary and SI units"
arch=('any')
url="https://github.com/ofek/binary"
license=('MIT' 'APACHE')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner' 'python-coverage')
source=("https://files.pythonhosted.org/packages/source/b/binary/binary-$pkgver.tar.gz"
       '001-setup.py.patch')
sha256sums=('6ec010e58f7331ebc8bc9638dbe6c66d635de60d5818b0723bef4dead0ec28a6'
            'f2cd5dc99ca22d9a2fc8a20c2fd7f1f77922338c22085a73a7737ea08dfc955f')

prepare() {
	## removes tests directory from installation
	patch -p1 -d "binary-$pkgver" < 001-setup.py.patch
}

build() {
	cd "binary-$pkgver"
	python setup.py build
}

check() {
	cd "binary-$pkgver"
	python setup.py pytest
}

package() {
	cd "binary-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm644 LICENSE-{APACHE,MIT} -t "$pkgdir/usr/share/licenses/$pkgname/"
}

