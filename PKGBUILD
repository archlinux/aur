# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_pkgname=python-varname
pkgname=${_pkgname}-git
pkgver=0.13.0.r0.gea1ec82
pkgrel=1
pkgdesc="A Python library to retrieve variable names from functions or classes -- git version"
arch=('any')
url="https://github.com/pwwang/${_pkgname}"
license=('MIT')
depends=('python')
makedepends=('git' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'python-poetry' 'python-virtualenv' 'python-cachecontrol' 'python-poetry-plugin-export' 'python-jsonschema')
source=("git+${url}.git")
sha512sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  git -C "${srcdir}/${_pkgname}" clean -dfx
}

build() {
  cd "${_pkgname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
