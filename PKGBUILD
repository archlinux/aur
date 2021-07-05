# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Francois Boulogne <fboulogne at april dot org>

pkgname=python-pims
_name="${pkgname#python-}"
pkgver=0.5
pkgrel=1
pkgdesc="Python Image Sequence: Load video and sequential images"
url="https://github.com/soft-matter/pims"
arch=('any')
license=('BSD')
depends=('python-slicerator' 'python-numpy')
# optdepends=('python-pillow: improved TIFF support'
#             'python-tifffile: alternative TIFF support')
makedepends=('python-setuptools')
# checkdepends=('python-nose')
source=("https://files.pythonhosted.org/packages/source/P/${_name^^}/${_name^^}-$pkgver.tar.gz")
sha256sums=('a02cdcbb153e2792042fb0bae7df4f30878bbba1f2d176114a87ee0dc18715a0')

build() {
	cd "${_name^^}-$pkgver"
	python setup.py build
}

# check() {
# 	cd "${_name^^}-$pkgver"
# 	nosetests3
# }

package() {
	cd "${_name^^}-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
