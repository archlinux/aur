# Maintainer: Martin Chang <marty188586@gmail.com>

pkgname=tt-topology
pkgver=1.2.16
pkgrel=1
pkgdesc="Tenstorrent Topology (TT-Topology) is a command line utility used to flash multiple NB cards on a system to use specific eth routing configurations."
arch=('any')
url='https://github.com/tenstorrent/tt-topology'
license=('Apache')
makedepends=(python-build python-installer python-wheel)
depends=(python-elasticsearch python-pydantic python-tt-tools-common python-networkx)
provides=('tt-topology=1.2.15')
conflicts=("tt-topology")
source=("tt-topology::git+https://github.com/tenstorrent/tt-topology.git#tag=v${pkgver}")
sha256sums=('2e654b345d46e8d791b18c9db347b864d83b1bcd323e421a482d0efea22e5c77')

build() {
    cd tt-topology
    python -m build --wheel --no-isolation
}

package() {
    cd tt-topology
    python -m installer --destdir="$pkgdir" dist/*.whl
    rm -rf $pkgdir/usr/lib/python*/site-packages/debian/ || true
}
