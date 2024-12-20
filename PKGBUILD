# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Contributor: Antony Lee <anntzer dot lee at gmail dot com>

_pyname=nbstripout
pkgname=python-$_pyname
pkgver=0.8.1
pkgrel=1
pkgdesc='Strips outputs from Jupyter and IPython notebooks'
url="https://pypi.python.org/pypi/$_pyname/"
depends=(python jupyter-nbformat)
checkdepends=(python-pytest)
makedepends=(python-build python-installer python-setuptools python-wheel)
license=('MIT')
arch=('any')
source=("https://pypi.org/packages/source/${_pyname:0:1}/$_pyname/$_pyname-$pkgver.tar.gz")
sha256sums=('eaac8b6b4e729e8dfe1e5df2c0f8ba44abc5a17a65448f0480141f80be230bb1')

build() {
  cd $_pyname-$pkgver
  python -m build -wn
}

package() {
  cd $_pyname-$pkgver
  install -D -m644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python -m installer dist/*.whl --destdir="$pkgdir"
}

#check() {
    #git clone https://github.com/kynan/nbstripout.git
    #cp -R nbstripout/tests/e2e_notebooks $_pyname-$pkgver/tests/
    #cd $_pyname-$pkgver
    #PYTHONPATH=. pytest tests
#}
