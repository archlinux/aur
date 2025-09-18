# Maintainer: Martin Chang <marty188586@gmail.com>

pkgname=tt-burnin-git
pkgver=v0.2.4.r0.g809f293
pkgrel=1
pkgdesc="Tenstorrent Burnin (TT-Burnin) is a command line utility to run a high power consumption workload on TT devices."
arch=('any')
url='https://github.com/tenstorrent/tt-burnin'
license=('Apache')
makedepends=(python-build python-installer python-wheel)
depends=(python-luwen python-tomli python-tt-tools-common)
provides=("tt-burnin")
conflicts=("tt-burnin")
source=("tt-burnin::git+https://github.com/tenstorrent/tt-burnin.git")
sha256sums=('SKIP')

pkgver() {
  cd tt-burnin
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd tt-burnin
    python -m build --wheel --no-isolation
}

package() {
    cd tt-burnin
    python -m installer --destdir="$pkgdir" dist/*.whl
    rm -rf $pkgdir/usr/lib/python*/site-packages/debian/ || true
}
