# Maintainer: haxibami <contact at haxibami dot net>

pkgname=python-pytun-pmd3
_pkgname="${pkgname#python-}"
pkgver=2.0.9
pkgrel=1
pkgdesc='A fork of https://github.com/montag451/pytun with partial Darwin support'
arch=('any')
url='https://github.com/doronz88/pytun-pmd3'
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-wheel' 'python-installer' 'python-setuptools' 'python-setuptools-scm')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c65bfbc31734d3b6c9b2cfc191fa546db6d867eb383ad431d10de2fca705cf0f')

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
