# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_base=chatterbot-corpus
pkgname=python-${_base}-git
pkgver=1.2.0.r137.g250c477
pkgrel=1
pkgdesc="A multilingual dialog corpus."
arch=('any')
url="https://github.com/gunthercox/${_base}"
license=('BSD-3-Clause')
depends=('python')
checkdepends=('python-sphinx' 'python-nose' 'flake8' 'python-sphinx' 'python-sphinx_rtd_theme' 'python-chatterbot' 'python-yaml')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'git')
source=(git+${url}.git)
sha512sums=('SKIP')

pkgver() {
  cd "${_base}"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_base}"
  python -m build --wheel --no-isolation
}

check() {
 cd "${_base}"
  nosetests
}

package() {
  cd "${_base}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 license.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
