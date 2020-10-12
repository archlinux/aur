# Maintainer: George Rawlinson <george@rawlinson.net.nz>

_pkgname=crashtest
pkgname=python-crashtest
pkgver=0.3.1
pkgrel=1
pkgdesc="Manage Python errors with ease"
arch=('any')
url="https://github.com/sdispater/crashtest"
license=('MIT')
depends=('python')
makedepends=('python-dephell')
checkdepends=('python-pytest' 'python-pytest-cov')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
#    "0001_unbundle-vendored-deps.patch")
b2sums=('b90465ee736ec0d9c378ed16327fe5bbddf19066a64a2a9d1c454f38eac5321235cafeb20756b2018e1dfea0e07726696084b8965a2543edc5e9fe0d79c33db1')

prepare() {
  cd "${srcdir}"/${_pkgname}-${pkgver}

  dephell deps convert --from pyproject.toml --to setup.py
}

build() {
  cd "${srcdir}"/${_pkgname}-${pkgver}

  python setup.py build
}

check() {
  cd "${srcdir}"/${_pkgname}-${pkgver}

  pytest
}

package() {
  cd "${srcdir}"/${_pkgname}-${pkgver}

  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
