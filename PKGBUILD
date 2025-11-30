# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
pkgname=python-watchpoints
pkgver=0.2.5
pkgrel=1
pkgdesc='Python variable/object monitor similar to gdb watchpoints'
arch=(any)
url='https://github.com/gaogaotiantian/watchpoints'
license=('Apache-2.0')
depends=('python>=3.6' 'python-objprint>=0.1.3')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
checkdepends=('python-pytest')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('78cb945f7885747998d21d16c25f708334a1948895f155125b056dc31b914122')

build() {
	cd watchpoints-$pkgver
	python -m build --wheel --no-isolation
}

check() {
	cd watchpoints-$pkgver
	python -m venv --system-site-packages test-env
	test-env/bin/python -m installer dist/*.whl
	test-env/bin/python -P -m pytest
}

package() {
	cd watchpoints-$pkgver
	python -m installer --destdir="$pkgdir" dist/*.whl
}
