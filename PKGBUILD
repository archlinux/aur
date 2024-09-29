# Maintainer: letscho <handbook_latch586 at simplelogin dot com>

pkgname=python-asteval-git
_name=asteval
pkgver=1.0.4.r4.g36dc5f1
pkgrel=1
pkgdesc="Minimalistic evaluator of python expression using ast module"
url="https://github.com/lmfit/asteval"
license=('MIT')
arch=('any')
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel')
checkdepends=('python-pytest-cov' 'python-numpy' 'tk')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/lmfit/asteval.git")
sha512sums=('SKIP')

pkgver() {
  cd "${_name}"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_name}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${_name}"
  python -m pytest
}

package() {
  cd "${_name}"
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
