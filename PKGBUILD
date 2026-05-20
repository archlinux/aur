# Maintainer: giver <giverc139@gmail.com>

_pyname=angr-management
pkgname=python-${_pyname}
pkgver=9.2.197
pkgrel=1
pkgdesc='The official GUI for angr'
url='https://github.com/angr/angr-management'
license=('BSD')
arch=('any')
depends=(
  'ipython'
  'pyside6'
  'pyside6-qtads'
  'python'
  'python-angr'
  'python-bidict'
  'python-binsync'
  'python-cle'
  'python-libbs'
  'python-pyqodeng'
  'python-qtawesome'
  'python-qtconsole'
  'python-qtpy'
  'python-requests'
  'python-rpyc'
  'python-thefuzz'
  'python-tomlkit'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('954530576d7417c4e6d615b9b58be5e6fe540f3534f0ab9aae3251784c68e12bd5d47009d94f2e5fe77e877d67f93160d432053bae75ee06933accc4d0a252d9')
b2sums=('e0e8a67d82b0ce83858257d6a212087fd62885d59ccd6140bf7ba897bcb6aecc42873fac964fd31ed698a80558b82b3fd2931ce67ab11e54972e65d1662f1ca2')

prepare() {
  # we don't support version pinning
  sed -e 's/==/>=/g' -i $_pyname-$pkgver/pyproject.toml
  # we don't support post-release and developmental-release
  sed -e 's/\.\(post\|dev\)[0-9]*//g' -i $_pyname-$pkgver/pyproject.toml
}

build() {
  cd ${_pyname}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${_pyname}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
