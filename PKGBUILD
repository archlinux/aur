# Maintainer: PumpkinCheshire <sollyonzou at gmail dot com>

pkgname=python-optimesh
_name=optimesh
pkgver=0.8.2
pkgrel=1
pkgdesc="Mesh optimization, mesh smoothing."
arch=('any')
url="https://github.com/nschloe/optimesh"
license=('GPL')
optdepends=('python-matplotlib')
makedepends=('python'
	'python-setuptools')
depends=('python-meshio' 'python-meshplex' 'python-numpy' 'python-quadpy' 'python-termplotlib')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('f0e2e47c77a600f6e57828aff4e45ed0f571c6af533fa17453ab7fc901589a9d')

# prepare() {
# 	cd "$srcdir/$_name-$pkgver"
#     dephell deps convert --from pyproject.toml --to setup.py
# }

build() {
	cd "$srcdir/$_name-$pkgver"
	python -c "from setuptools import setup; setup()" build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python -c "from setuptools import setup; setup();" install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}
