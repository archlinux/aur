# Maintainer: haxibami <contact at haxibami dot net>

pkgname=python-ipsw_parser
_pkgname="${pkgname#python-}"
pkgver=1.3.9
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
sha256sums=('b7c0bde62585a2b33ee3a7854d4473ab8766cc4ed654c3ed017995e6e3af3928')

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
