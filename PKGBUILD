# Maintainer: Lorenzo Gaifas <brisvag at gmail dot com>

_name='magicgui'
_name_slug="${_name//-/_}"
_author='pyapp-kit'
pkgname="python-${_name}"
pkgver=0.9.1
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
  'python-pyconify'
  'python-qtpy'
  'python-superqt'
  'python-typing_extensions'
  'qt5-python-bindings'
)
source=("https://files.pythonhosted.org/packages/source/${_name_slug::1}/${_name_slug}/${_name_slug}-${pkgver}.tar.gz")
sha256sums=('e8c1c7ed281e62ec858771a76515abd705dbe3d46da2ee834ce6983a4403b94d')

build() {
  cd "${srcdir}/${_name_slug}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_name_slug}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim:set ts=2 sw=2 et:<Paste>
