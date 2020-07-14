# Contributor: Pierre Buard <pierre.buard@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Sebastien Piccand <sebcactus gmail com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Jelle van der Waa <jelle@archlinux.org>
# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>

pkgname=('python2-pyenchant')
pkgver=2.0.0
pkgrel=6
arch=('any')
url="https://pypi.python.org/pypi/pyenchant"
license=('LGPL')
makedepends=('python2-setuptools' 'enchant')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/rfk/pyenchant/archive/v${pkgver}.tar.gz"
        "enchant-2.patch")
sha512sums=('21f8dd286f1f462d11aea0f1b89f3189e51109a3a8c5baee80cba17b9e7c56fa60f308d4ea39d9675d69e3da11dc07996eb32d545cd3567503f0956abc060882'
            'c6dc74e60c684b5606b681096d740814a5f138e9caf8ad2f41d9e467c820d46bab6b3d449a99dc17e4b1e1b89964d1fc4248c55a600c977ee6269cddb46ad596')

prepare() {
  cd ${srcdir}/pyenchant-${pkgver}

  patch -Np1 -i "${srcdir}/enchant-2.patch"
}

build() {
  cp -r pyenchant-${pkgver} pyenchant2-${pkgver}

  cd ${srcdir}/pyenchant2-${pkgver}

  python2 setup.py build
}

package_python2-pyenchant() {
  pkgdesc="PyEnchant is a spellchecking library for Python2 based on the Enchant library"
  depends=('python2' 'enchant')

  cd pyenchant2-${pkgver}
  
  python2 setup.py install --root=${pkgdir} --optimize=1
}
