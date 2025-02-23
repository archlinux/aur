# Maintainer: haxibami <contact at haxibami dot net>

pkgname=python-pykdebugparser
_pkgname="${pkgname#python-}"
pkgver=1.2.4
pkgrel=2
pkgdesc='Kdebug events and ktraces parser'
arch=('any')
url='https://github.com/matan1008/pykdebugparser'
license=('MIT')
depends=('python' 'python-construct' 'python-pygments' 'python-click' 'python-termcolor')
makedepends=('python-build' 'python-wheel' 'python-installer' 'python-setuptools')
checkdepends=('python-pytest')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2c4e4e00ca2b1475bb0207ebcbcfef6db525e9fca949c9e20aaebf79ec2bc352')

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
