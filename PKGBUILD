# Maintainer: haxibami <contact at haxibami dot net>

pkgname=python-ipsw_parser
_pkgname="${pkgname#python-}"
pkgver=1.4.4
pkgrel=1
pkgdesc='Python3 utility for parsing and extracting data from IPSW'
arch=('any')
url='https://github.com/doronz88/ipsw_parser'
license=('GPL-3.0-or-later')
depends=(
  'python' 'python-construct' 'python-click' 'python-coloredlogs' 'python-cached-property'
  'python-plumbum' 'python-pyimg4' 'python-remotezip2'
)
makedepends=('python-build' 'python-wheel' 'python-installer' 'python-setuptools' 'python-setuptools-scm')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('67123fda0ac9cb46a64dc2b8fcc922cdae45d37e1e94fd56c1e297fed3002161')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  export SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
