# Maintainer: Lorenzo Cappelletti <lorenzo.cappelletti gmail.com>

pkgname=python-mbed-tools
pkgver=7.57.0
pkgrel=1
pkgdesc='Command line interface for Mbed OS'
arch=('any')
url="https://os.mbed.com"
license=('Apache')
# See src/mbed-tools-7.53.0/setup.py
depends=(
  'cmake'
  'ninja'
  'python'
  'python-dotenv'
  'python-click>=7.1', 'python-click<9',
  'python-tqdm'
  'python-tabulate'
  'python-requests'
  'python-psutil'
  'python-pyudev'
  'python-typing_extensions'
  'python-jinja'
  'python-pyserial'
)
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ARMmbed/mbed-tools/archive/${pkgver}.tar.gz")
sha256sums=('7b8a5003f55932f5233d830de87156a2c285faa18fa9412e86ee42ea48885898')
provides=('python-mbed-tools')

_remove_windows() {
  rm -rf "${pkgdir}"/usr/lib/python*/site-packages/mbed_tools/devices/_internal/windows/
}

package() {
  cd "mbed-tools-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  _remove_windows
  python setup.py clean --all
}

# vim:set ts=2 sw=2 et:
