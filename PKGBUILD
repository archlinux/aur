# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_base=dataprep
pkgname=python-${_base}-git
pkgver=0.4.4.r19.gae07c1e
pkgrel=1
pkgdesc="A low code data preparation library in python -- git version"
arch=('any')
url="https://github.com/sfu-db/${_base}"
license=('MIT')
depends=('python')
makedepends=('git' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'python-poetry' 'python-nose' 'python-jsonschema4.17')
source=("git+${url}.git")
sha512sums=('SKIP')

pkgver() {
  cd "${_base}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_base}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_base}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
