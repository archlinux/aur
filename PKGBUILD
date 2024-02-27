# Maintainer: Lorenzo Gaifas <brisvag at gmail dot com>

_name='napari-console'
_author='napari'
pkgname="${_name}"
pkgver=0.0.9
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
  'python'
  'python-ipykernel'
  'python-qtconsole'
  'python-qtpy'
)
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('3bc86dd96cf94b1af96bba1043f90a39b1369bb978a8df9038a1ac422e66b532')

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
