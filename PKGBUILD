# Maintainer: Lorenzo Gaifas <brisvag at gmail dot com>

_name='napari'
pkgname="${_name}"
pkgver=0.4.18
pkgrel=1
pkgdesc='Multi-dimensional image viewer for Python.'
arch=('any')
url='https://napari.org'
license=('BSD')
makedepends=(
  'icoutils'
  'python-build'
  'python-installer'
  'python-setuptools-scm'
)
depends=(
  'napari-console'
  'napari-npe2'
  'napari-plugin-engine'
  'napari-svg'
  'python'
  'python-app-model'
  'python-appdirs'
  'python-cachey'
  'python-certifi'
  'python-dask'
  'python-imageio'
  'python-jsonschema'
  'python-lazy-loader'
  'python-magicgui'
  'python-numpy'
  'python-numpydoc'
  'python-opengl'
  'python-pandas'
  'python-pillow'
  'python-pint'
  'python-psutil'
  'python-psygnal'
  'python-pyyaml'
  'python-pydantic'  # community package has been out of date for months
  'python-pygments'
  'python-qtpy'
  'python-scikit-image'
  'python-scipy'
  'python-sphinx'
  'python-superqt'
  'python-tifffile'
  'python-toolz'
  'python-tqdm'
  'python-typing_extensions'
  'python-vispy'
  'python-wrapt'
  'qt5-python-bindings'
)
source=(
  "https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz"
  "${_name}.desktop"
)
sha256sums=(
  "8dcad79e0d0bc6378c7b6b1e85c8085834aad26d22d1339ae0aa1b7eed5238a2"
  "909cfd907ee6d78ad7f80a6d0aaf23b83d246e31f7e2331860072f6bf7e5edd6"
)

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}"
  install -Dm644 ${_name}.desktop "${pkgdir}/usr/share/applications/${_name}.desktop"

  cd "${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"

  # icons
  icotool -x "${_name}/resources/icon.ico"
  for _size in 16 32 48 64 128 256; do
    install -Dm644 icon_*${_size}x${_size}*.png "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/${_name}.png"
  done
}

# vim:set ts=2 sw=2 et:<Paste>
