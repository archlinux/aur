# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-libusb-package
_name=${pkgname#python-}
pkgver=1.0.30.1
pkgrel=1
pkgdesc='Package containing libusb so it can be installed via Python package managers'
arch=($CARCH)
url='https://github.com/pyocd/libusb-package'
license=('Apache-2.0')
provides=(${_name})
conflicts=(${_name})
depends=(
  'python'
  'python-importlib_resources'
  'python-pyusb'
  # AUR
  pyinstaller
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
  'python-setuptools-scm'
  'python-tomli'
  'libusb'
)
source=("$_name-$pkgver::${url}/archive/v$pkgver.tar.gz")
sha256sums=('b75bfbe17dafd1cb0729d0479804dae969d748050243f62951a163c6931545e1')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
}
