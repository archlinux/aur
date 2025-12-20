# Maintainer: Martin Chang <marty188586@gmail.com>

pkgname=tt-burnin
pkgver=0.3.0
pkgrel=1
pkgdesc="Tenstorrent Burnin (TT-Burnin) is a command line utility to run a high power consumption workload on TT devices."
arch=('any')
url='https://github.com/tenstorrent/tt-burnin'
license=('Apache')
makedepends=(python-build python-installer python-wheel)
depends=(python-luwen python-tomli python-tt-tools-common)
provides=('tt-burnin=0.2.9')
conflicts=("tt-burnin")
source=("tt-burnin::git+https://github.com/tenstorrent/tt-burnin.git#tag=v${pkgver}")
sha256sums=('f1da97c54bb42dadfcf7a2c8a153e5960b26e0878316b370c5054e1728d0c9a3')

build() {
    cd tt-burnin
    python -m build --wheel --no-isolation
}

package() {
    cd tt-burnin
    python -m installer --destdir="$pkgdir" dist/*.whl
    rm -rf $pkgdir/usr/lib/python*/site-packages/debian/ || true
}
