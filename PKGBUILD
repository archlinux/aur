# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Francois Boulogne <fboulogne at april dot org>

pkgname=python-pims
_name="${pkgname#python-}"
pkgver=0.6.1
pkgrel=1
pkgdesc="Python Image Sequence: Load video and sequential images"
url="https://github.com/soft-matter/pims"
arch=('any')
license=('BSD')
depends=('python>=3.7' 'python-imageio' 'python-numpy' 'python-slicerator')
# optdepends=('python-pillow: improved TIFF support'
#             'python-tifffile: alternative TIFF support')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
# checkdepends=('python-nose' 'python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/P/${_name^^}/${_name^^}-$pkgver.tar.gz")
sha256sums=('e2b704461d4ea9bce8b6a22ca35836fe67d6d34537736b405341ae5547194f3b')

prepare() {
	cd "${_name^^}-$pkgver"
	sed -i '/packages=/s/, "pims.tests"//' setup.py
}

build() {
	cd "${_name^^}-$pkgver"
	python -m build --wheel --no-isolation
}

# check() {
# 	cd "${_name^^}-$pkgver"
# 	nosetests
# }

package() {
	cd "${_name^^}-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
