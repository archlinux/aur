# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Maximilian Stahlberg <maximilian.stahlberg tu-berlin de>

pkgname=python-cyipopt
pkgver=1.6.1
pkgrel=1
pkgdesc='Cython interface for the interior point optimzer IPOPT'
arch=(x86_64)
url='https://github.com/mechmotum/cyipopt/'
license=(EPL-2.0)
depends=(glibc
         python
         python-scipy
         python-numpy
         python-pytest
         coin-or-ipopt)

makedepends=(cython
             git
             python-build
             python-installer
             python-setuptools
             python-wheel)

source=("https://github.com/mechmotum/cyipopt/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5a827a9f94b34a6924e6f6d257248c2b75d95598c6b2b315d9315e4cdb0847a4')

build() {
  cd "cyipopt-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "cyipopt-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
