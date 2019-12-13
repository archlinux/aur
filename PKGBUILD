# Maintainer: Michael Stegeman <mstegeman@mozilla.com>
pkgbase=python-adapt-parser
pkgname=('python-adapt-parser' 'python2-adapt-parser')
pkgver=0.3.4
pkgrel=1
pkgdesc='A text-to-intent parsing framework'
arch=('any')
url='https://github.com/MycroftAI/adapt'
license=('Apache')
makedepends=('python-setuptools' 'python2-setuptools')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/MycroftAI/adapt/archive/v${pkgver}.tar.gz"
)
sha256sums=(
  '20c88955911b7c8db2742bb753eca7e2a4fd0c350e183e9b93fa0295083c3ad9'
)

prepare() {
  cp -a adapt-${pkgver}{,-py2}
  find "adapt-${pkgver}-py2" -name \*.py -exec sed -i '1s/python$/&2/' {} +
}

build() {
  cd "${srcdir}/adapt-${pkgver}"
  python setup.py build

  cd "${srcdir}/adapt-${pkgver}-py2"
  python2 setup.py build
}

package_python-adapt-parser() {
  depends=('python-argparse' 'python-pyee' 'python-six')

  cd "${srcdir}/adapt-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1
}

package_python2-adapt-parser() {
  depends=('python2-argparse' 'python2-pyee' 'python2-six')

  cd "${srcdir}/adapt-${pkgver}-py2"
  python2 setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et ft=sh:
