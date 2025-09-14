# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-spsdk-pqc
_name=${pkgname#python-}
pkgver=0.6.7
pkgrel=3
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
sha512sums=('67d127f6cc6b9a4c4370912531351d70fc91a53a4d992e881455f53bfd23e8727e0ee1cf789a6316d3fd32bc7e6d4d2a3e096c075479755790a9279ae0fe69aa')
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
