# Maintainer: Martin Chang <marty188586@gmail.com>

pkgname=tt-topology-git
pkgver=1.2.13.r0.g20266ae
pkgrel=1
pkgdesc="Tenstorrent Topology (TT-Topology) is a command line utility used to flash multiple NB cards on a system to use specific eth routing configurations."
arch=('any')
url='https://github.com/tenstorrent/tt-topology'
license=('Apache')
makedepends=(python-build python-installer python-wheel)
depends=(python-elasticsearch python-pydantic python-tt-tools-common python-networkx)
provides=("tt-topology")
conflicts=("tt-topology")
source=("tt-topology::git+https://github.com/tenstorrent/tt-topology.git")
sha256sums=('SKIP')

pkgver() {
  cd tt-topology
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//'
}

build() {
    cd tt-topology
    python -m build --wheel --no-isolation
}

package() {
    cd tt-topology
    python -m installer --destdir="$pkgdir" dist/*.whl
    rm -rf $pkgdir/usr/lib/python*/site-packages/debian/ || true
}
