# Maintainer: haxibami <contact at haxibami dot net>

pkgname=python-ipsw_parser
_pkgname="${pkgname#python-}"
pkgver=1.4.1
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
sha256sums=('3ec5677707092306ce4e38e00785835e7a37d9b882166b3ad25dad7934e5d65f')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  export SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
