# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Maintainer: Richard PALO <richard.palo@free.fr>
# Contributor: Florian Walch <florian.walch@gmx.at>
# Contributor: Robin Baumgartner <robin@baumgartners.ch>
_base=relatorio
pkgname=python-${_base}
pkgver=0.10.1
pkgrel=1
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
sha512sums=('460f446944e6d8dc156f8d0ae287d9c2805e0843dcb304088cee92093e84be7b884ede6b3696af7a33527cc633e5de73269e6003f644f0d2a5b1ad0196a9f607')

build() {
  cd ${_base}-${pkgver}
  python setup.py build
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
