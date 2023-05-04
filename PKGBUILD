# Maintainer: Bao Trinh <qubidt at gmail dot com>

pkgname=python-darker
pkgver=1.7.1
pkgrel=3
pkgdesc='Apply black reformatting to Python files only in regions changed since a given commit'
arch=('any')
url=https://github.com/akaihola/darker
license=('BSD')
depends=('python'
         'python-black'
         'python-toml')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest'
              'python-pytest-kwparametrize'
              'git'
              'python-regex'
              'python-pygments'
              'python-flynt'
              'python-isort')
optdepends=('python-isort: for sorting import statements'
            'python-pygments: terminal syntax highlighting'
            'python-flynt: convert string literals to f-strings')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/akaihola/darker/releases/download/${pkgver}/darker-${pkgver}.tar.gz")
sha512sums=('37fc69a66651bf251eae626bb2a848f797ad4cb6ac89faef6847a419168d139ba4adb5b0af87bdeb4159fc779c9f81059702ae890e4235b0f9e831f6ef6bdf75')

build() {
  cd "darker-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "darker-${pkgver}"
  PYTHONPATH="$PWD/build/lib:${PYTHONPATH}" python -m pytest
}

package() {
  cd "darker-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -vDm 644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}
