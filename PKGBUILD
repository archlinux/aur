# Maintainer: Martin Chang <marty188586@gmail.com>

pkgname=tt-burnin
pkgver=0.4.3
pkgrel=1
pkgdesc="Tenstorrent Burnin (TT-Burnin) is a command line utility to run a high power consumption workload on TT devices."
arch=('any')
url='https://github.com/tenstorrent/tt-burnin'
license=('Apache')
makedepends=(python-build python-installer python-wheel)
depends=(python-luwen python-tomli python-tt-tools-common)
provides=('tt-burnin=0.4.2')
conflicts=("tt-burnin")
source=("tt-burnin::git+https://github.com/tenstorrent/tt-burnin.git#tag=v${pkgver}")
sha256sums=('4d10faa598a347a6be48247cacd5da18a86b9dff0068142c9dfb9860ecb07ccb')

build() {
    cd tt-burnin
    python -m build --wheel --no-isolation
}

package() {
    cd tt-burnin
    python -m installer --destdir="$pkgdir" dist/*.whl
    rm -rf $pkgdir/usr/lib/python*/site-packages/debian/ || true
}
