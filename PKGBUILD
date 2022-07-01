# Maintainer: Lorenzo Gaifas <brisvag at gmail dot com>

_name='superqt'
_author='napari'
pkgname="python-${_name}"
pkgver=0.3.2
pkgrel=1
pkgdesc='Missing widgets and components for Qt-python.'
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
  'python-packaging'
  'python-pygments'
  'python-qtpy'
  'python-typing-extensions'
)
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('a37df244a2d6e4387e865cdedabe925798b3352ab9cdc52f60701eb12d907960')
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
