# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Francois Boulogne <fboulogne at april dot org>

pkgname=python-trackpy
_name="${pkgname#python-}"
pkgver=0.5.0
pkgrel=1
pkgdesc="Python particle tracking tool"
url="https://github.com/soft-matter/trackpy"
arch=('any')
license=('BSD')
depends=('python>=3.6' 'python-numpy>=1.14' 'python-scipy>=1.1' 'python-matplotlib' 'python-yaml')
makedepends=('python-setuptools')
checkdepends=('python-nose')
optdepends=("python-pims: simplifies image-reading"
            "python-pytables: saving results in an HDF5 file"
            "python-numba: for accelerated feature-finding and linking"
            "python-pillow: for some display routines")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('b5e8a40491a4cdc1c8c5f15e75e468b9ee51f677018d330622f9277468d0f297')

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

# check() {
#     cd trackpy-"$pkgver"
#     nosetests3
# }

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
