# Maintainer: haxibami <contact at haxibami dot net>

pkgname=python-remotezip
pkgver=0.12.3
pkgrel=1
pkgdesc='Python module to access single members of a zip archive without downloading the full content from a remote web server'
arch=('any')
url='https://github.com/gtsystem/python-remotezip'
license=('MIT')
depends=('python' 'python-requests')
makedepends=('python-build' 'python-wheel' 'python-installer' 'python-setuptools')
checkdepends=('python-requests-mock')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('662bd0859b25d90e41a0698fb694bd90ba5e2b4591e101bbb44984f7943aeb42')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python test_remotezip.py
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
