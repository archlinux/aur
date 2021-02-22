# Maintainer: Lorenzo Cappelletti <lorenzo.cappelletti gmail.com>

pkgname=python-mbed-tools
pkgver=7.1.2
pkgrel=1
pkgdesc='Future command line tool for Mbed OS'
arch=('any')
url="https://os.mbed.com"
license=('Apache')
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
  'python-prettytable'
  'python-intelhex'
  'python-future'
)
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ARMmbed/mbed-tools/archive/${pkgver}.tar.gz")
sha256sums=('17e18585c06c20c456a89615075231108c190763db5367372495f4051d118192')
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
