# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=control
pkgname=python-${_name}
pkgver=0.10.1
pkgrel=1
pkgdesc="Implements basic operations for analysis and design of feedback control systems in Python"
arch=('any')
license=('BSD-3-Clause')
url="https://github.com/python-control/python-control"
depends=('python>=3.10' 'python-numpy>=1.23' 'python-scipy>=1.8' 'python-matplotlib>=3.6')
optdepends=('python-slycot' 'python-slycot>=0.4.0' 'python-cvxopt>=1.2.0')
makedepends=('python-setuptools' 'python-setuptools-scm' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-timeout' 'python-ruff')
options=('staticlibs')
source=("https://files.pythonhosted.org/packages/source/c/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('740459809604c801a4b1dabbdd97b202')

build() {
    cd "$srcdir"/${_name}-${pkgver}
    # Install the package in a temporary root directory
    pip install --no-deps --root="$srcdir/install" --prefix=/usr .
}

check() {
  cd ${_name}-$pkgver
  pytest -v
}

package() {
  cd ${_name}-$pkgver

  install -m755 -d "${pkgdir}/usr/share/licenses/python-${_name}"
  install -m644 LICENSE "${pkgdir}/usr/share/licenses/python-${_name}/"
  cd "$srcdir/install"
  # Copy files to the package directory
  cp -r . "$pkgdir"
}
