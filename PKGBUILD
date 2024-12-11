# Maintainer: Lorenzo Gaifas <brisvag at gmail dot com>

_name='napari-svg'
_name_slug="${_name//-/_}"
_author='napari'
pkgname="${_name}"
pkgver=0.2.0
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
  'python'
  'python-imageio'
  'python-numpy'
  'python-vispy'
)
source=("https://files.pythonhosted.org/packages/source/${_name_slug::1}/${_name_slug//-/_}/${_name_slug//-/_}-$pkgver.tar.gz")
sha256sums=('9e2f295bae33e45c0195032bbb2cb3f372e8016f0f3d69715dac3cb3505d10f6')

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
