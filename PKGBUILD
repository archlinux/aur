# Maintainer: Matthew Sexton <matthew@asylumtech.com>
# Contributor: Eduardo Parra Mazuecos <eduparra90@gmail.com>
pkgname=python-pyexcel-ods
_pkgname=${pkgname#python-}
pkgver=0.6.0
pkgrel=1
pkgdesc="A plugin to pyexcel to read, manipulate and write data in ods format using odfpy"
arch=('i686' 'x86_64')
url="https://github.com/pyexcel/pyexcel-ods"
license=('BSD-3-clause')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pyexcel' 'python-pyexcel-xls' 'python-nose' 'python-psutil' 'python-coverage')
depends=('python' 'python-odfpy' 'python-pyexcel-io')
source=("https://github.com/pyexcel/pyexcel-ods/archive/v$pkgver.tar.gz")
md5sums=('0d9557135f9b3d16fd42ecde8ff979c5')

build() {
  cd "${_pkgname}-$pkgver"
  python -m build --wheel --no-isolation
}

check(){
  cd "${_pkgname}-$pkgver"
  nosetests --with-coverage --cover-package pyexcel_ods --cover-package tests tests --with-doctest --doctest-extension=.rst README.rst docs/source pyexcel_ods
}

package() {
  cd "${_pkgname}-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
