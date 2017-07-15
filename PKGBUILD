# Contributor: Serkan Hosca <serkan@hosca.com>

pkgbase=python-importanize
pkgname=(python-importanize python2-importanize)
pypi_name=importanize
pkgver=0.5.3
pkgrel=1
pkgdesc="Utility for organizing Python imports using PEP8 or custom rules"
arch=('any')
license=('MIT')
url="https://pypi.python.org/pypi/importanize/"
makedepends=('python' 'python2' 'python-pathlib2' 'python2-pathlib2')
source=("https://pypi.io/packages/source/i/${pypi_name}/${pypi_name}-${pkgver}.tar.gz")
md5sums=('950e0aeb191df70533b1fac240cdbb76')

prepare() {
  cp -a ${pypi_name}-${pkgver}{,-python2}
}

build() {
  cd "${srcdir}/${pypi_name}-${pkgver}"
  python setup.py build

  cd "${srcdir}/${pypi_name}-${pkgver}-python2"
  python2 setup.py build
}

package_python-importanize() {
  pkgdesc='Python 3 client for importanize'
  depends=('python' 'python-pathlib2')

  cd "${srcdir}/${pypi_name}-${pkgver}"
  python setup.py install --optimize=1 --prefix=/usr --root="${pkgdir}" --skip-build
}

package_python2-importanize() {
  pkgdesc='Python 2 client for importanize'
  depends=('python2' 'python2-pathlib2')

  cd "${srcdir}/${pypi_name}-${pkgver}-python2"
  python2 setup.py install --optimize=1 --prefix=/usr --root="${pkgdir}" --skip-build
  mv ${pkgdir}/usr/bin/importanize ${pkgdir}/usr/bin/importanize2
}

# vim: set ft=sh ts=4 sw=4 noet:
