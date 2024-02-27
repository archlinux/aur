# Maintainer: Lorenzo Gaifas <brisvag at gmail dot com>

_name='npe2'
_author='napari'
_framework='napari'
pkgname="${_framework}-${_name}"
pkgver=0.7.4
pkgrel=1
pkgdesc='napari plugin refactor.'
arch=('any')
url="https://github.com/${_author}/${_name}"
license=('BSD')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools-scm'
)
depends=(
  'python'
  'python-appdirs'
  'python-magicgui'
  'python-psygnal'
  'python-pydantic'
  'python-pyyaml'
  'python-rich'
  'python-tomli-w'
  'python-typer'
)
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('969d5394b24225cff1ab6625f29ea1603a6509714bd9496c49e697c3e49077b0')

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
