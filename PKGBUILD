# Maintainer: Mark Collins <tera_1225 hat hotmail.com>
pkgname=matrix-commander
pkgver=7.2.0
pkgrel=1
pkgdesc="Simple CLI-based Matrix client"
arch=('any')
url="https://github.com/8go/matrix-commander"
license=('GPL')
depends=(
  # adapted from requirements.txt:
  "python>3.7"
  "python-aiohttp"
  "python-aiofiles>=0.6.0"
  "python-argparse"
  # "python-asyncio" part of python since 3.3
  # "python-datetime" part of standard python
  "python-emoji"
  "python-markdown"
  "python-matrix-nio>=0.14.1"
  "python-pillow"
  "python-magic"
  "python-pyxdg"
  # "python-uuid" part of standard python

  # other dependencies:
  "python-atomicwrites"  # optdepends of matrix-nio, but included because matrix-commander wants it for encryption
  "python-cachetools"  # optdepends of matrix-nio, but included because matrix-commander wants it for encryption
  "python-olm"  # optdepends of matrix-nio, but included because matrix-commander wants it for encryption
  "python-peewee"  # optdepends of matrix-nio, but included because matrix-commander wants it for encryption
)
optdepends=(
  "python-notify2: needed for notifications on desktop systems"
)
provides=()
conflicts=()
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b01f710247632c235f7651e50255bbd96056cf2af5c52fb38880a095b497127d')

package() {
  # Note: sometimes its "matrix-commander" and sometimes "matrix_commander"...
  local _site_packages
  _site_packages="$(python -c "import site; print(site.getsitepackages()[0])")"
  install -d "${pkgdir}${_site_packages}/${pkgname}/bin/"
  install -D -m 755 "${pkgname}-${pkgver}/matrix_commander/matrix_commander.py" "${pkgdir}/${_site_packages}/${pkgname}/bin/"
  install -d "${pkgdir}/usr/bin/"
  ln -s "${_site_packages}/${pkgname}/bin/matrix_commander.py" "${pkgdir}/usr/bin/${pkgname}"
}

