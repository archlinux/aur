# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-spsdk-pqc
_name=${pkgname#python-}
pkgver=0.7.1
pkgrel=1
pkgdesc="Post-Quantum Crypto support for SPSDK"
arch=($CARCH)
url="https://pypi.org/project/${_name}"
license=(BSD-3-Clause)
depends=(
  glibc
  python
  python-click
  python-pyasn1
  python-pycryptodome
  python-typing_extensions
  # AUR
  pyinstaller
)
makedepends=(
  cmake
  python-build
  python-installer
  python-setuptools
  python-setuptools-scm
  python-toml
  python-wheel
)
checkdepends=(
  python-pytest

)
optdepends=()
groups=(spsdk-plugins)
# options=('!strip' '!debug')
provides=(${_name})
conflicts=(${_name})
replaces=(${_name})
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-${pkgver}.tar.gz")
sha512sums=('d8e0e761892a745659dca4b0bfaf4f613fdbd795b56c96bdaa17a894c1fa7f099386f415623afec6bc0df826c8ff4a3218c5af86852f9efda8dfcef480d6bdcf')
_name=${_name//-/_}

build() {
  cd ${srcdir}/$_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd ${srcdir}/$_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
}
