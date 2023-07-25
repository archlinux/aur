# Maintainer: Lorenzo Gaifas <brisvag at gmail dot com>

_name='magicgui'
_author='pyapp-kit'
pkgname="python-${_name}"
pkgver=0.7.2
pkgrel=1
pkgdesc='Build GUIs from functions, using magic.'
arch=('any')
url="https://github.com/${_author}/${_name}"
license=('BSD')
makedepends=(
  'python-build'
  'python-hatch-vcs'
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
sha256sums=('568c65268cac2ad2d6010d54f37d96bfc3c4caf2219d0a59498608e63b9463e2')

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
