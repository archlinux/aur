# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="lxst"
pkgname="python-${_name}"
pkgver=0.3.0
pkgrel=1
pkgdesc="Lightweight Extensible Signal Transport for Reticulum"
arch=('any')
# url="https://git.unsigned.io/markqvist/${_name}"
url="https://pypi.org/project/${_name}"
license=('CC-BY-NC-ND-4.0')
depends=(
  'i2c-tools'
  'python>=3.13'
  'python-audioop-lts>=0.2.1'
  'python-numpy'
  'python-pycodec2'
  'python-rns>=0.9.5'
  'python-soundcard'
)
makedepends=(
  'python-installer'
)
optdepends=(
  'python-simpleaudio: for playing AudioSegments (first preference)'
  'python-pyaudio: for playing AudioSegments (second preference)'
  'python-ffpyplayer: for playing AudioSegments (third preference)'
  'python-scipy: SciPy versions of high_pass_filter, low_pass_filter, and band_pass_filter'
)
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/${_name}/${_name//-/_}-${pkgver}-py3-none-any.whl")
sha256sums=('23bc9bb4ca635394efac2fae371a8cf63bab2b1003ba4e449b06f0e4d0854d66')

package() {
  local site_packages="$(python -c "import site; print(site.getsitepackages()[0])")"

  cd "${srcdir}"
  python -m installer --destdir="${pkgdir}" "${_name//-/_}-${pkgver}-py3-none-any.whl"

  install -vd "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -vs "${site_packages}/${_name}-${pkgver}.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
