# Maintainer: Lorenzo Gaifas <brisvag at gmail dot com>

_name='npe2'
_author='napari'
_framework='napari'
pkgname="${_framework}-${_name}"
pkgver=0.1.2
pkgrel=1
pkgdesc='napari plugin refactor.'
arch=('any')
url="https://github.com/${_author}/${_name}"
license=('BSD')
makedepends=(
  'python-setuptools-scm'
  'python-dephell'
)
depends=(
  'napari-plugin-engine'
  'python'
  'python-importlib-metadata'
  'python-intervaltree'
  'python-magicgui'
  'python-psygnal'
  'python-pyaml'
  'python-pydantic'
  'python-pytomlpp'
  'python-typer'
)
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('760cf7f700c130542c4342c5d88b0ff24f0abfba251e843cbb835abb43a271d4')
provides=("${_framework}-${_name}")

prepare() {
  cd "${srcdir}/${_name}-${pkgver}"
  dephell deps convert --from pyproject.toml --to setup.py
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
