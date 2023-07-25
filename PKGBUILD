# Maintainer: Lorenzo Gaifas <brisvag at gmail dot com>

_name='napari-svg'
_author='napari'
pkgname="${_name}"
pkgver=0.1.10
pkgrel=1
pkgdesc='A plugin for writing svg files from napari.'
arch=('any')
url="https://github.com/${_author}/${_name}"
license=('BSD')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools-scm'
)
depends=(
  'napari-plugin-engine'
  'python'
  'python-imageio'
  'python-numpy'
  'python-vispy'
)
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('18e642c888a71e09c9d1097f25bced1e7ef5dde1771469647bcd77975800f77d')

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
