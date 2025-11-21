# Maintainer: giver <giverc139@gmail.com>

_pyname=angr-management
pkgname=python-${_pyname}
pkgver=9.2.160
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
sha512sums=('499fa15bda2147c5351db436c62c191b88e3f729bd5884884532831c89d2d1b3d411d69eb759ffdcd78c7efaae3f95950bdf392b4457f1d44ca119314d98cf0a')
b2sums=('1c16a9e31d7dfa5e816b3440b92d6c0c4916ce8c24e01d9d18d4c99eb3fc776a8cd87373615c6e3f0851d93a8120a53bda2aca8107303a912985db7dccd08c71')

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
