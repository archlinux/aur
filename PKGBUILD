# Maintainer: redponike <proton (dot) me>
# Contributor: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-linear-operator
_pkgname=linear_operator
pkgver=0.6
pkgrel=1
pkgdesc='A LinearOperator implementation to wrap the numerical nuts and bolts of GPyTorch'
arch=('x86_64')
url='https://github.com/cornellius-gp/linear_operator/'
license=('MIT')
depends=('python-pytorch' 'python-scipy' 'python-mpmath' 'python-jaxtyping')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
checkdepends=('python-pytest' 'flake8' 'python-typeguard')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('a9e2663879f1a2b28631bf7ef34892c4e5749893e711c8ef0ab0a39aff70a654')

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${_pkgname}-${pkgver}"
  pytest -vv
}

package() {
  cd "${_pkgname}-${pkgver}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
