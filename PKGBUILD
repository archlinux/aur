# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-libusb-package
_name=${pkgname#python-}
pkgver=1.0.26.4
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
sha256sums=('7ace1abc918a9633645dc6bfafed5cfcac5b2b5ab7519c6fa91452ca674c2d6d')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
}
