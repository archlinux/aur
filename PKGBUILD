# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>

pkgname=python-equation
_pkgname=Equation
pkgver=1.2.01
pkgrel=2
pkgdesc="General Equation Parser and Evaluator"
arch=('any')
url="https://github.com/glenfletcher/Equation"
license=('custom')
depends=(python)
makedepends=(python-setuptools)
optdepends=("python-numpy: Vector Maths"
            "python-scipy: SciConst")
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
        # retrieved from https://web.archive.org/web/20150913004722/http://www.alphaomega-technology.com.au/license/AOT-OL/1.0
        # and cleaned up a bit
        "LICENCE.html")
sha256sums=('c8a21dc47d6c748fd19b6485978cf8c42fe31c43db7f44789d95fb5e9752b81c'
            '9549c8a9a3cb2fb71af32bd1d0500a033d96423faf3c28905ae9902831eab6b5')

check() {
  cd "${_pkgname}-${pkgver}"
  python setup.py test
}

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  install -Dm644 LICENCE.html "$pkgdir/usr/share/licenses/$pkgname/LICENSE.html"

  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
