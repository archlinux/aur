# Maintainer: haxibami <contact at haxibami dot net>

pkgname=python-remotezip2
pkgver=0.0.2
pkgrel=1
pkgdesc='Python module to access single members of a zip archive without downloading the full content from a remote web server (fork)'
arch=('any')
url='https://github.com/doronz88/python-remotezip2'
license=('MIT')
depends=('python' 'python-requests')
makedepends=('python-build' 'python-wheel' 'python-installer' 'python-setuptools' 'python-setuptools-scm')
checkdepends=('python-requests-mock')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d1a91009a96973fac5caaa9374aa0b39ee149765c837f60a6384270886d68898')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python test_remotezip2.py
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
