# Maintainer: Lorenzo Gaifas <brisvag at gmail dot com>

_name='magicgui'
_author='tlambert03'
pkgname="python-${_name}"
pkgver=0.3.6
pkgrel=1
pkgdesc='Build GUIs from functions, using magic.'
arch=('any')
url="https://github.com/${_author}/${_name}"
license=('BSD')
makedepends=(
  'python-setuptools-scm'
)
depends=(
  'python'
  'python-typing_extensions'
  'python-qtpy'
  'python-psygnal'
  'python-docstring-parser'
  'qt5-python-bindings'
)
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('fda7b20a6380623241dc9e2fd3317870e5e7e08521c6f98c38bbd68f81b450f7')
provides=("python-${_name}")

prepare() {
  cd "${srcdir}/${_name}-${pkgver}"
  # for now we need this for pep517
  cat > setup.py <<EOF
from setuptools import setup
setup()
EOF
}

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim:set ts=2 sw=2 et:<Paste>
