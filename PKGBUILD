# Maintainer: haxibami <contact at haxibami dot net>

pkgname=python-pytun-pmd3
_pkgname="${pkgname#python-}"
pkgver=2.0.10
pkgrel=2
pkgdesc='A fork of https://github.com/montag451/pytun with partial Darwin support'
arch=('x86_64')
url='https://github.com/doronz88/pytun-pmd3'
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-wheel' 'python-installer' 'python-setuptools' 'python-setuptools-scm')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('bf1b1a0ea605389677d0488d33d2521be83595cda13a5a5fda6af329dbcbf8bc')

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
