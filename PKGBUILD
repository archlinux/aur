# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-libusb-package
_name=${pkgname#python-}
pkgver=1.0.26.3
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
source=("$pkgname-$pkgver::${url}/archive/v$pkgver.tar.gz")
sha256sums=('c83823b244bb153a0bb8d1e1d86cd4553d354dd6fbfc87ed2aae8d3a3acd6df8')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
}
