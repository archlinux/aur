# Maintainer: Lorenzo Gaifas <brisvag at gmail dot com>

_name='napari-console'
_name_slug="${_name//-/_}"
_author='napari'
pkgname="${_name}"
pkgver=0.1.2
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
source=("https://files.pythonhosted.org/packages/source/${_name_slug::1}/${_name_slug}/${_name_slug}-${pkgver}.tar.gz")
sha256sums=('2e6311104715673c70b1d4c44d77ae19fc6ec4ca61fed1670602c5bc2cd3be68')

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
