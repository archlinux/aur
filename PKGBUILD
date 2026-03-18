# Maintainer: haxibami <contact at haxibami dot net>

pkgname=python-pytun-pmd3
_pkgname="${pkgname#python-}"
pkgver=3.0.3
pkgrel=1
pkgdesc='A fork of https://github.com/montag451/pytun with partial Darwin support'
arch=('x86_64')
url='https://github.com/doronz88/pytun-pmd3'
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-wheel' 'python-installer' 'python-setuptools' 'python-setuptools-scm')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('047832c7b3146874cb94117ae8a6141ba6a22af187007317c5bc83bc363a398a')

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
