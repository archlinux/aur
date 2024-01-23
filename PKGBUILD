_name="xknx"
pkgname="python-$_name"
pkgver=2.11.2
pkgrel=1
pkgdesc="XKNX is the underlying library for the KNX integration in Home Assistant."
arch=('x86_64')
url="https://github.com/XKNX/xknx"
license=('MIT')
source=("https://github.com/XKNX/$_name/archive/refs/tags/$pkgver.tar.gz"
        "0001-Unpin-setuptools.patch")
sha256sums=('d090b4540d5021d0783b3276b50560956ab1d3c59aabc1d7261b829b18cb42d7'
            '07bcfd9a0e4852b0d539a1a7dd8e50ab4908536bd8024f8ea9795f361a170325')
makedepends=(python-build python-installer python-wheel python-setuptools)

prepare() {
    cd "$_name-$pkgver"
    patch --forward --strip=1 --input="${srcdir}/0001-Unpin-setuptools.patch"
}

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
