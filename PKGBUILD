# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="lxst"
pkgname="python-${_name}"
pkgver=0.4.0
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
  'python-numpy>=2.3.4'
  'python-pycodec2>=4.1.0'
  'python-rns>=1.0.1'
  'python-soundcard>=0.4.5'
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
options=(
  '!strip'
)
source=(
  "https://files.pythonhosted.org/packages/py3/${_name::1}/${_name}/${_name//-/_}-${pkgver}-py3-none-any.whl"
)
noextract=(
  "${source[@]##*/}"
)
sha256sums=('6174306f9002fd4eb2ea2c3658e3402735cae691ac43b37a22790c23f5ccb9b0')

package() {
  local site_packages="$(python -c "import site; print(site.getsitepackages()[0])")"

  cd "${srcdir}"
  python -m installer --destdir="${pkgdir}" "${_name//-/_}-${pkgver}-py3-none-any.whl"

  install -vd "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -vsf "${site_packages}/${_name}-${pkgver}.dist-info/licenses/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
