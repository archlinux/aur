# Maintainer: Martin Chang <marty188586@gmail.com>

pkgname=tt-flash
pkgver=3.4.10
pkgrel=1
pkgdesc="Tenstorrent Firmware Update Utility"
arch=('any')
url='https://github.com/tenstorrent/tt-flash'
license=('Apache')
makedepends=(python-build python-installer python-wheel)
depends=(python-yaml python-luwen python-tabulate python-tomli python-tt-tools-common)
provides=('tt-flash=3.4.9')
conflicts=("tt-flash")
source=("tt-flash::git+https://github.com/tenstorrent/tt-flash.git#tag=v${pkgver}")
sha256sums=('6b06609f5dba4c8fcc3370846d6e07c0d179e1b4d55d2a626779c0f7d1030745')

build() {
    cd tt-flash
    python -m build --wheel --no-isolation
}

package() {
    cd tt-flash
    python -m installer --destdir="$pkgdir" dist/*.whl
    rm -rf $pkgdir/usr/lib/python*/site-packages/debian/ || true
}
