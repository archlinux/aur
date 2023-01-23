# Maintainer: Lorenzo Gaifas <brisvag at gmail dot com>

_name='napari-console'
_author='napari'
pkgname="${_name}"
pkgver=0.0.6
pkgrel=1
pkgdesc='A plugin that adds a console to napari.'
arch=('any')
url="https://github.com/${_author}/${_name}"
license=('BSD')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools-scm'
)
depends=(
  'ipython'
  'napari-plugin-engine'
  'python'
  'python-ipykernel'
  'python-qtconsole'
  'python-qtpy'
)
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('d3bbd3c25392ef0dabfaebc52d4866fc859b2d99e3dad9da4bc13f1a991cd500')
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
