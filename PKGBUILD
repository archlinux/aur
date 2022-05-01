# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Francois Boulogne <fboulogne at april dot org>

pkgname=python-pims
_name="${pkgname#python-}"
pkgver=0.6.0
pkgrel=1
pkgdesc="Python Image Sequence: Load video and sequential images"
url="https://github.com/soft-matter/pims"
arch=('any')
license=('BSD')
depends=('python>=3.7' 'python-imageio' 'python-numpy' 'python-slicerator')
# optdepends=('python-pillow: improved TIFF support'
#             'python-tifffile: alternative TIFF support')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
# checkdepends=('python-nose')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/P/${_name^^}/${_name^^}-$pkgver.tar.gz")
sha256sums=('1102742d642c8b8acc710d35d502b5d7085ee1288c3618373ef8c472030bc683')

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
# 	nosetests3
# }

package() {
	cd "${_name^^}-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
