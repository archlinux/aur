# Maintainer: Lorenzo Gaifas <brisvag at gmail dot com>

_name='magicgui'
_author='tlambert03'
pkgname="python-${_name}"
pkgver=0.5.1
pkgrel=1
pkgdesc='Build GUIs from functions, using magic.'
arch=('any')
url="https://github.com/${_author}/${_name}"
license=('BSD')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools-scm'
  'python-wheel'
)
depends=(
  'python'
  'python-docstring-parser'
  'python-psygnal'
  'python-qtpy'
  'python-typing_extensions'
  'qt5-python-bindings'
)
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('dcd05c4c9bbd55bdeb72d41069b2d4304952dabe04c2aac7bdd43f5a4e3a8a94')
provides=("python-${_name}")

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim:set ts=2 sw=2 et:<Paste>
