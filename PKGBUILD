# Maintainer: Lorenzo Gaifas <brisvag at gmail dot com>

_name='superqt'
_author='pyapp-kit'
pkgname="python-${_name}"
pkgver=0.6.1
pkgrel=2
pkgdesc='Missing widgets and components for Qt-python.'
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
  'python-packaging'
  'python-pygments'
  'python-qtpy'
  'python-typing-extensions'
  'qt5-python-bindings'
)
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('f1a9e0499c4bbcef34b6f895eb57cd41301b3799242cd030029238124184dade')

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
