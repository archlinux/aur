# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Maintainer: Richard PALO <richard.palo@free.fr>
# Contributor: Florian Walch <florian.walch@gmx.at>
# Contributor: Robin Baumgartner <robin@baumgartners.ch>
_base=relatorio
pkgname=python-${_base}
pkgver=0.10.0
pkgrel=3
pkgdesc="A templating library able to output odt and pdf files"
arch=(any)
url="https://${_base}.tryton.org"
license=(GPL)
depends=(python-genshi python-lxml)
makedepends=(python-setuptools)
optdepends=('python-pycha: chart support'
  'python-yaml: char support'
  'python-magic: fodt support')
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('a154e1b462526f298c0a931e7e78ddcc3fbf3744a1a129a346e442502c3f056b87cc5b94f9c8375b32954755f9e0a6cb94ece83671fd77f2473e98d2a0ec42b1')

build() {
  cd ${_base}-${pkgver}
  export PYTHONHASHSEED=0
  python setup.py build
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
