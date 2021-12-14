# Maintainer: Lorenzo Gaifas <brisvag at gmail dot com>

_name='superqt'
_author='napari'
pkgname="python-${_name}"
pkgver=0.2.5
pkgrel=1
pkgdesc='Missing widgets and components for Qt-python.'
arch=('any')
url="https://github.com/${_author}/${_name}"
license=('BSD')
makedepends=(
  'python-setuptools-scm'
  'python-dephell'
)
depends=(
  'python'
  'python-typing-extensions'
)
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('580278f077048d86e10960073e62345a8b479bf0f030097a1d63205c9f0d4f8d')
provides=("python-${_name}")

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
