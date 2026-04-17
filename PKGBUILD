# Maintainer: Martin Chang <marty188586@gmail.com>

pkgname=tt-flash
pkgver=3.6.5
pkgrel=1
pkgdesc="Tenstorrent Firmware Update Utility"
arch=('any')
url='https://github.com/tenstorrent/tt-flash'
license=('Apache')
makedepends=(python-build python-installer python-wheel)
depends=(python-yaml python-luwen python-tabulate python-tomli python-tt-tools-common)
provides=('tt-flash=3.6.4')
conflicts=("tt-flash")
source=("tt-flash::git+https://github.com/tenstorrent/tt-flash.git#tag=v${pkgver}")
sha256sums=('511b8b806a2aeed65e7ec1d0cc69f4e35ab10a3241aad802d025d4986dec6b0a')

build() {
    cd tt-flash
    python -m build --wheel --no-isolation
}

package() {
    cd tt-flash
    python -m installer --destdir="$pkgdir" dist/*.whl
    rm -rf $pkgdir/usr/lib/python*/site-packages/debian/ || true
}
