# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Maintainer: Richard PALO <richard.palo@free.fr>
# Contributor: Florian Walch <florian.walch@gmx.at>
# Contributor: Robin Baumgartner <robin@baumgartners.ch>
_base=relatorio
pkgname=python-${_base}
pkgver=0.12.0
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
sha512sums=('81b3432537047299196864afd5e690f8833c26b1337179d14d17c96f5652ab96bcee346a1f0577a10d57c0d0d82caef3abf88d39bfda450fd40051d33248c36b')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
