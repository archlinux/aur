# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>

pkgname=python-equation
_pkgname=Equation
pkgver=1.2.01
pkgrel=1
pkgdesc="General Equation Parser and Evaluator"
arch=('any')
url="https://github.com/glenfletcher/Equation"
license=('custom')
depends=(python)
makedepends=(python-setuptools)
optdepends=("python-numpy: Vector Maths"
            "python-scipy: SciConst")
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
        "LICENCE.html::https://web.archive.org/web/20150913004722/http://www.alphaomega-technology.com.au/license/AOT-OL/1.0")
sha256sums=('c8a21dc47d6c748fd19b6485978cf8c42fe31c43db7f44789d95fb5e9752b81c'
            '8a9706fc32b39254aacefa09194d35255b36fd141675fe03cccee030194ed229')

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
