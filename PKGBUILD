# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
pkgname=python-zftools
pkgver=1.0
pkgrel=1
pkgdesc='Sagemath package to calculate zero forcing number of graphs'
arch=('x86_64')
url='https://github.com/alexhutman/zftools'
license=(GPL-3.0-only)
depends=('sagemath')
makedepends=('python-setuptools' 'cython')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('696ff51cd2200e415d64f4b2348e1bd94094efe1c125626d0fef0d141bc421ed')

build() {
	cd "zftools-$pkgver"
	COMPILE_WAVEFRONT=true python setup.py build
}

check() {
	cd "zftools-$pkgver"
	python -m venv --system-site-packages test-env
	test-env/bin/python setup.py install --optimize=1
	test-env/bin/python -m pytest
}

package() {
	cd "zftools-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
