# Maintainer: Lorenzo Gaifas <brisvag at gmail dot com>

_name='napari'
_author='napari'
pkgname="${_name}"
pkgver=0.4.12
pkgrel=2
pkgdesc='Multi-dimensional image viewer for Python.'
arch=('any')
url='https://napari.org'
license=('BSD')
makedepends=(
  'python-setuptools-scm'
  'icoutils'
)
depends=(
  'python'
  'python-importlib-metadata'
  'python-appdirs'
  'python-cachey'
  'python-dask'
  'python-imageio'
  'python-importlib-metadata'
  'python-jsonschema'
  'python-magicgui'
  'python-napari-console'
  'python-napari-svg'
  'python-napari-plugin-engine'
  'python-numpy'
  'python-numpydoc'
  'python-pandas'
  'python-pillow'
  'python-pint'
  'python-psutil'
  'python-opengl-accelerate'
  'python-pyaml'
  'python-pydantic'
  'python-qtpy'
  'python-scipy'
  'python-superqt'
  'python-tifffile'
  'python-typing_extensions'
  'python-toolz'
  'python-tqdm'
  'python-vispy'
  'python-wrapt'
  'qt5-python-bindings'
)
source=(
  "https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz"
  "${_name}.desktop"
)
sha256sums=(
  '6cb7c09b53b3ad921fc1609a672c76dca0b11106cb440922457660c5e6eb6020'
  '909cfd907ee6d78ad7f80a6d0aaf23b83d246e31f7e2331860072f6bf7e5edd6')
provides=("${_name}")

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}"
  install -Dm644 ${_name}.desktop "${pkgdir}/usr/share/applications/${_name}.desktop"

  cd "${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"

  # icons
  icotool -x "${_name}/resources/icon.ico"
  for _size in 16 32 48 64 128 256; do
    install -Dm644 icon_*${_size}x${_size}*.png "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/${_name}.png"
  done
}

# vim:set ts=2 sw=2 et:<Paste>
