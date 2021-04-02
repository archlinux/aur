# Maintainer: Lorenzo Cappelletti <lorenzo.cappelletti gmail.com>

pkgbase=python-mbed-os-tools
pkgname=(
  'python-mbed-os-tools'
  'python-mbed-ls'
  'python-mbed-host-tests'
  'python-mbed-greentea'
)
pkgver=0.0.15
pkgrel=1
pkgdesc="The tools to test and work with Mbed OS"
arch=('any')
url="https://os.mbed.com/"
license=('Apache')
makedepends=('python-setuptools')
source=("${pkgbase}-${pkgver}.tar.gz::https://github.com/ARMmbed/mbed-os-tools/archive/v${pkgver}.tar.gz")
sha256sums=('60e77755e43d9dc0612ecbbb02ff3321dd79993a664a22c3ad2405f6de61c7e2')

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

# vim:set ts=2 sw=2 et:
