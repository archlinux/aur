# Maintainer: BlackFuffey <fluffistical@gmail.com>
# Maintainer: qubeck <qubeck [AT] disroot [DOT] org>
# Contributor: devome <evinedeng@hotmail.com>
# Contributor: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Philippe Hürlimann <p at hurlimann dot org>

pkgname=python-ftfy
_name=${pkgname#python-}
pkgver=6.3.1
pkgrel=3
pkgdesc='Fixes mojibake and other problems with Unicode, after the fact'
arch=(any)
url='https://ftfy.readthedocs.io'
license=(Apache-2.0)
depends=(
  python
  python-wcwidth
)
makedepends=(
  python-build
  python-hatchling
  python-installer
)
checkdepends=(python-pytest)
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('9b3c3d90f84fb267fe64d375a07b7f8912d817cf86009ae134aa03e1819506ec')

build() {
  cd "${_name}-${pkgver}"

  python -m build --wheel --no-isolation
}

check() {
  cd "${_name}-${pkgver}"

  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  PATH="${PWD}/test-env/bin:${PATH}" \
    test-env/bin/python -P -m pytest -o addopts=""
}

package() {
  cd "${_name}-${pkgver}"

  python -m installer --destdir="${pkgdir}" dist/*.whl
}
