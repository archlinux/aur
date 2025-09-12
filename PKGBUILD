# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-spsdk-pqc
_name=${pkgname#python-}
pkgver=0.6.6
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
# options=('!strip' '!debug')
provides=(${_name})
conflicts=(${_name})
replaces=(${_name})
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-${pkgver}.tar.gz")
sha512sums=('af230ad7a505120852a54ceaaca1513d8cd582cb4a032583d854b5bfd2953a60f30533fd69398cfa321ec33644de93a35e384c5c19f86c0d495419d637cdad7e')
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
