# Maintainer: haxibami <contact at haxibami dot net>

pkgname=python-ipsw_parser
_pkgname="${pkgname#python-}"
pkgver=1.3.7
pkgrel=1
pkgdesc='Python3 utility for parsing and extracting data from IPSW'
arch=('any')
url='https://github.com/doronz88/ipsw_parser'
license=('GPL3')
depends=(
  'python' 'python-construct' 'python-click' 'python-coloredlogs' 'python-cached-property'
  'python-plumbum' 'python-pyimg4'
)
makedepends=('python-build' 'python-wheel' 'python-installer' 'python-setuptools' 'python-setuptools-scm')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('adadd5810334be4813cac5f1c8cf913195f97ff3a0a871e7310d65944b722a0e')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  export SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
