# Contributor: Serkan Hosca <serkan@hosca.com>

pkgbase=python-importanize
pkgname=(python-importanize python2-importanize)
_realname=importanize
pkgver=0.4.1
pkgrel=1
pkgdesc="Utility for organizing Python imports using PEP8 or custom rules"
arch=('any')
license=('MIT')
url="https://pypi.python.org/pypi/importanize/"
depends=('python')
source=("https://pypi.python.org/packages/source/i/importanize/importanize-${pkgver}.tar.gz")
md5sums=('84eb9e9087c17676f8b2e5cb2668b2dd')

prepare() {
  cp -a ${_realname}-${pkgver}{,-python2}
}

build() {
  cd "${srcdir}/${_realname}-${pkgver}"
  python setup.py build

  cd "${srcdir}/${_realname}-${pkgver}-python2"
  python2 setup.py build
}

package_python-importanize() {
  pkgdesc='Python 3 client for importanize'
  depends=('python')

  cd "${srcdir}/${_realname}-${pkgver}"
  python setup.py install --optimize=1 --prefix=/usr --root="${pkgdir}" --skip-build
}

package_python2-importanize() {
  pkgdesc='Python 2 client for importanize'
  depends=('python2')

  cd "${srcdir}/${_realname}-${pkgver}-python2"
  python2 setup.py install --optimize=1 --prefix=/usr --root="${pkgdir}" --skip-build
  mv ${pkgdir}/usr/bin/importanize ${pkgdir}/usr/bin/importanize2
}

# vim: set ft=sh ts=4 sw=4 noet:
