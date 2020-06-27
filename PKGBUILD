# Maintainer: Lorenzo Cappelletti <lorenzo.cappelletti gmail.com>

pkgbase=python-mbed-os-tools
pkgname=(
  'python-mbed-os-tools'
  'python-mbed-ls'
  'python-mbed-host-tests'
  'python-mbed-greentea'

  'python2-mbed-os-tools'
  'python2-mbed-ls'
  'python2-mbed-host-tests'
  'python2-mbed-greentea'
)
pkgver=0.0.14
pkgrel=1
pkgdesc="The tools to test and work with Mbed OS"
arch=('any')
url="https://os.mbed.com/"
license=('Apache')
makedepends=('python-setuptools' 'python2-setuptools')
source=("${pkgbase}-${pkgver}.tar.gz::https://github.com/ARMmbed/mbed-os-tools/archive/v${pkgver}.tar.gz")
sha256sums=('e9fbc3413ef387b201cf2b6a057bdaec81ea7c8a54654b63f2119f4f8b89debc')

_remove_test() {
  # Why are tests installed?
  rm -rf "${pkgdir}"/usr/lib/python*/site-packages/test/
  sed -e '/^test$/d' --in-place\
    "${pkgdir}"/usr/lib/python*/site-packages/*.egg-info/top_level.txt
}

### mbed-os-tools ###########################################################

package_python-mbed-os-tools() {
  depends=(
    'python'
    'python-pyserial'
    'python-requests'
    'python-intelhex'
    'python-future'
    'python-prettytable'
    'python-fasteners'
    'python-appdirs'
    'python-junit-xml'
    'python-lockfile'
    'python-six'
    'python-colorama'
    'python-beautifulsoup4'
  )

  cd "mbed-os-tools-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  _remove_test
  python setup.py clean --all
}

package_python2-mbed-os-tools() {
  depends=(
    'python2'
    'python2-pyserial'
    'python2-requests'
    'python2-intelhex'
    'python2-future'
    'python2-prettytable'
    'python2-fasteners'
    'python2-appdirs'
    'python2-junit-xml'
    'python2-lockfile'
    'python2-six'
    'python2-colorama'
    'python2-beautifulsoup4'
  )

  cd "mbed-os-tools-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  _remove_test
  python2 setup.py clean --all
}

### mbed-ls #################################################################

package_python-mbed-ls() {
  conflicts=('python2-mbed-ls')
  depends=(
    'python'
    'python-prettytable'
    'python-mbed-os-tools'
  )

  cd "mbed-os-tools-${pkgver}/packages/mbed-ls"
  python setup.py install --root="${pkgdir}/" --optimize=1
  _remove_test
  python setup.py clean --all
}

package_python2-mbed-ls() {
  conflicts=('python-mbed-ls')
  depends=(
    'python'
    'python-prettytable'
    'python-mbed-os-tools'
  )

  cd "mbed-os-tools-${pkgver}/packages/mbed-ls"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  _remove_test
  python2 setup.py clean --all
}

### mbed-host-tests #########################################################

package_python-mbed-host-tests() {
  conflicts=('python2-mbed-host-tests')
  depends=(
    'python'
    'python-mbed-os-tools'
  )

  cd "mbed-os-tools-${pkgver}/packages/mbed-host-tests"
  python setup.py install --root="${pkgdir}/" --optimize=1
  _remove_test
  python setup.py clean --all
}

package_python2-mbed-host-tests() {
  conflicts=('python-mbed-host-tests')
  depends=(
    'python'
    'python-mbed-os-tools'
  )

  cd "mbed-os-tools-${pkgver}/packages/mbed-host-tests"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  _remove_test
  python2 setup.py clean --all
}

### mbed-greentea ###########################################################

package_python-mbed-greentea() {
  conflicts=('python2-mbed-greentea')
  depends=(
    'python'
    'python-mbed-os-tools'
  )

  cd "mbed-os-tools-${pkgver}/packages/mbed-greentea"
  python setup.py install --root="${pkgdir}/" --optimize=1
  _remove_test
  python setup.py clean --all
}

package_python2-mbed-greentea() {
  conflicts=('python-mbed-greentea')
  depends=(
    'python'
    'python-mbed-os-tools'
  )

  cd "mbed-os-tools-${pkgver}/packages/mbed-greentea"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  _remove_test
  python2 setup.py clean --all
}

# vim:set ts=2 sw=2 et:
