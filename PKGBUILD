# Maintainer: Martin Chang <marty188586@gmail.com>

pkgname=tt-topology
pkgver=1.2.15
pkgrel=1
pkgdesc="Tenstorrent Topology (TT-Topology) is a command line utility used to flash multiple NB cards on a system to use specific eth routing configurations."
arch=('any')
url='https://github.com/tenstorrent/tt-topology'
license=('Apache')
makedepends=(python-build python-installer python-wheel)
depends=(python-elasticsearch python-pydantic python-tt-tools-common python-networkx)
provides=('tt-topology=1.2.14')
conflicts=("tt-topology")
source=("tt-topology::git+https://github.com/tenstorrent/tt-topology.git#tag=v${pkgver}")
sha256sums=('f36832097e90788d32e6f1b517ed12c9a92c4306ec47caec24d5507dd7cda2c8')

build() {
    cd tt-topology
    python -m build --wheel --no-isolation
}

package() {
    cd tt-topology
    python -m installer --destdir="$pkgdir" dist/*.whl
    rm -rf $pkgdir/usr/lib/python*/site-packages/debian/ || true
}
