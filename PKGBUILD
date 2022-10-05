# Maintainer: Mark Collins <tera_1225 hat hotmail.com>
pkgname=matrix-commander
pkgver=3.5.3
pkgrel=1
pkgdesc="Simple CLI-based Matrix client"
arch=('any')
url="https://github.com/8go/matrix-commander"
license=('GPL')
depends=(
  # adapted from requirements.txt
  "python>3.7"
  "python-aiohttp"
  "python-aiofiles>=0.6.0"
  "python-argparse"
  # "python-asyncio" part of python since 3.3
  # "python-datetime" part of standard python
  "python-markdown"
  "python-matrix-nio>=0.14.1"
  "python-pillow"
  "python-magic"
  "python-pyxdg"
  # "python-uuid" part of standard python 
)
optdepends=(
  "dbus-python: needed for notifications on desktop systems"
  "python-notify2: needed for notifications on desktop systems"
)
provides=()
conflicts=()
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d2126ca1ba7c2bd984f156893a2968b5112818ab38fee73fb10c2d4a38989ddd')

package() {
  # Note: sometimes its "matrix-commander" and sometimes "matrix_commander"...
  local _site_packages
  _site_packages="$(python -c "import site; print(site.getsitepackages()[0])")"
  install -d "${pkgdir}${_site_packages}/${pkgname}/bin/"
  install -D -m 755 "${pkgname}-${pkgver}/matrix_commander/matrix_commander.py" "${pkgdir}/${_site_packages}/${pkgname}/bin/"
  install -d "${pkgdir}/usr/bin/"
  ln -s "${_site_packages}/${pkgname}/bin/matrix_commander.py" "${pkgdir}/usr/bin/${pkgname}"
}
