# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Peter Simons <simons@cryp.to>
# Contributor: Nicolas Pouillard <nicolas.pouillard@gmail.com>

pkgbase=zbase32
pkgname=('python-zbase32')
pkgver=1.1.5
pkgrel=4
pkgdesc="Alternate base32 encoder (not RFC 3548 compliant)"
arch=('any')
url='https://pypi.python.org/pypi/zbase32'
license=('BSD')
depends=('python-pyutil')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/z/$pkgbase/$pkgbase-$pkgver.tar.gz"
        'LICENSE')
sha256sums=('9b25c34ba586cbbad4517af516e723599a6f38fc560f4797855a5f3051e6422f'
            'c341afeb154cdcf20c247c8289fadd82245c89d0ea40b630c98885481c29845f')

prepare() {
	cd "$pkgbase-$pkgver"
	sed -i '/packages=/s/find_packages()/["zbase32"]/' setup.py
	rm -rf "$pkgbase.egg-info"
}

build() {
	cd "$pkgbase-$pkgver"
	2to3 -wn -j 4 .
	python -m build --wheel --no-isolation

}

package_python-zbase32() {
	cd "$pkgbase-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 ../LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
