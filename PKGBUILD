# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Maximilian Stahlberg <maximilian.stahlberg tu-berlin de>

pkgname=python-cyipopt
pkgver=1.5.0
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
sha256sums=('88f280be6540607bac082be95385f473d922bfa4e811a5ec00f97fbdeca925fa')

build() {
  cd "cyipopt-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "cyipopt-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
