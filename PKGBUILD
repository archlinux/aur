# Maintainer: haxibami <contact at haxibami dot net>

pkgname=python-pykdebugparser
_pkgname="${pkgname#python-}"
pkgver=1.2.7
pkgrel=1
pkgdesc='Kdebug events and ktraces parser'
arch=('any')
url='https://github.com/matan1008/pykdebugparser'
license=('MIT')
depends=('python' 'python-construct' 'python-pygments' 'python-click' 'python-termcolor')
makedepends=('python-build' 'python-wheel' 'python-installer' 'python-setuptools')
checkdepends=('python-pytest')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d48d0123a0ce3c7ac82f9ff343f921dd95909eb6146bae38f2ba91a4895a5c8a')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  mkdir -p "${srcdir}/tmp"
  mv tests "${srcdir}/tmp"
  python -m build --wheel --no-isolation
  mv "${srcdir}/tmp/tests" .
}

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m pytest
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
