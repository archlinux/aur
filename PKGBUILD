# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-spsdk-pqc
_name=${pkgname#python-}
pkgver=0.7.5
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
sha512sums=('9dcf0ff7197ec83d6adccf2304bb63a5e79be467a5555d27b5326574ebed4f923a411cf6e51f740a3737d3ba65feacbceac9f81514f8c99d2df72380afb2e252')
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
