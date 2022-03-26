# Maintainer: Lorenzo Cappelletti <lorenzo.cappelletti gmail.com>

pkgname=python-mbed-tools
pkgver=7.53.0
pkgrel=1
pkgdesc='Future command line tool for Mbed OS'
arch=('any')
url="https://os.mbed.com"
license=('Apache')
# See src/mbed-tools-7.53.0/setup.py
depends=(
  'cmake'
  'ninja'
  'python'
  'python-dotenv'
  'python-click'
  'python-pdoc'
  'python-gitpython'
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
sha256sums=('0c0d2f3c89a3b90638a3a8d5f8d94112e305ce00639053dba37ac2efc18ae64b')
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
