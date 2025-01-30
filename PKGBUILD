# Maintainer: Hao Long <aur@esd.cc>

pkgname=python-runlike
_pkgname=runlike
pkgver=1.5.4
pkgrel=1
pkgdesc="Given an existing docker container, prints the command line necessary to run a copy of it"
arch=("any")
url="https://github.com/lavie/runlike"
license=('BSD-2-Clause-Views')
depends=(python python-click)
makedepends=(python-build python-installer python-poetry-core)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
b2sums=('7a229289d25c5dc4b13b6288f69030364e6e7f556dff7b869c16e7c5163b8a31ff43081a77ebe9c1e63e01765a4ef0e797a24c1951f1fb4f45d7b0fc4bca4b19')

build() {
  cd ${_pkgname}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${_pkgname}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt
}
