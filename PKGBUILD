# Maintainer: Lorenzo Gaifas <brisvag at gmail dot com>

_name='magicgui'
_author='pyapp-kit'
pkgname="python-${_name}"
pkgver=0.7.3
pkgrel=1
pkgdesc='Build GUIs from functions, using magic.'
arch=('any')
url="https://github.com/${_author}/${_name}"
license=('BSD')
makedepends=(
  'python-build'
  'python-hatch-vcs'
  'python-hatchling'
  'python-installer'
)
depends=(
  'python'
  'python-docstring-parser'
  'python-psygnal'
  'python-qtpy'
  'python-superqt'
  'python-typing_extensions'
  'qt5-python-bindings'
)
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('3279b7e78e690f35c18b61065cf3234c4f05a973e485dc3c696446a68a59c665')

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
