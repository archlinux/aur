# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Maintainer: Richard PALO <richard.palo@free.fr>
# Contributor: Florian Walch <florian.walch@gmx.at>
# Contributor: Robin Baumgartner <robin@baumgartners.ch>
_base=relatorio
pkgname=python-${_base}
pkgver=1.0.0
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
sha512sums=('07ca7db3d7256975c462e483e7cf07721dbfe3ec3f0527ad89517d447cd2e7f080d0bf8aab7a0aabdb488983f88880d043e111fb6472f53c6e26312fc13973fd')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
