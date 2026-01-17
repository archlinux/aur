# Maintainer: Martin Chang <marty188586@gmail.com>

pkgname=tt-flash
pkgver=3.6.0
pkgrel=1
pkgdesc="Tenstorrent Firmware Update Utility"
arch=('any')
url='https://github.com/tenstorrent/tt-flash'
license=('Apache')
makedepends=(python-build python-installer python-wheel)
depends=(python-yaml python-luwen python-tabulate python-tomli python-tt-tools-common)
provides=('tt-flash=3.5.0')
conflicts=("tt-flash")
source=("tt-flash::git+https://github.com/tenstorrent/tt-flash.git#tag=v${pkgver}")
sha256sums=('5de49c87fb8b6a79cc191a9650880afabe36b1299a23d479e1b3dd553ddb464b')

build() {
    cd tt-flash
    python -m build --wheel --no-isolation
}

package() {
    cd tt-flash
    python -m installer --destdir="$pkgdir" dist/*.whl
    rm -rf $pkgdir/usr/lib/python*/site-packages/debian/ || true
}
