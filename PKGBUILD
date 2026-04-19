# Maintainer: Christos Longros <chris.longros@gmail.com>

pkgname=zfs-autobackup
_pyname=zfs_autobackup
pkgver=3.3
pkgrel=1
pkgdesc="ZFS snapshot and replication tool with thinning, verification, and remote transfer"
arch=('any')
url="https://github.com/psy0rz/zfs_autobackup"
license=('GPL-3.0-or-later')
depends=(
    'python'
    'python-colorama'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
sha256sums=('9c073599daed2049944b4b8ca8e76f574ef13f4d8c163e85e6e0938825ed9ccb')

build() {
    cd "${_pyname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pyname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
