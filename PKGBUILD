# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Maintainer: Richard PALO <richard.palo@free.fr>
# Contributor: Florian Walch <florian.walch@gmx.at>
# Contributor: Robin Baumgartner <robin@baumgartners.ch>
_base=relatorio
pkgname=python-${_base}
pkgver=0.12.1
pkgrel=1
pkgdesc="A templating library able to output odt and pdf files"
arch=(any)
url="https://${_base}.tryton.org"
license=(GPL)
depends=(python-genshi python-lxml)
makedepends=(python-build python-installer python-setuptools python-wheel)
optdepends=('python-pycha: chart support'
  'python-yaml: char support'
  'python-magic: fodt support')
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('2829d25c1a4a62d75841d71aac0e9b2e8b25156e33dfd98100febb814dd96d82f77709a4bab953c7a572138dee7b90afa01971d2cee903620e3ebd1cfee0b1a8')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
