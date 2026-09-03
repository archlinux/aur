# Maintainer: Martin Chang <marty188586@gmail.com>

pkgname=tt-flash
pkgver=3.11.0
pkgrel=1
pkgdesc="Tenstorrent Firmware Update Utility"
arch=('any')
url='https://github.com/tenstorrent/tt-flash'
license=('Apache')
makedepends=(python-build python-installer python-wheel)
depends=(python-yaml python-luwen python-tabulate python-tomli python-tt-tools-common)
provides=('tt-flash=3.10.0')
conflicts=("tt-flash")
source=("tt-flash::git+https://github.com/tenstorrent/tt-flash.git#tag=v${pkgver}")
sha256sums=('3861f7deabd7c9513df590be91a7875a9ab914ab6bb331a0d6728eff78e34e23')

build() {
    cd tt-flash
    python -m build --wheel --no-isolation
}

package() {
    cd tt-flash
    python -m installer --destdir="$pkgdir" dist/*.whl
    rm -rf $pkgdir/usr/lib/python*/site-packages/debian/ || true
}
