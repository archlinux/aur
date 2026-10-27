# Maintainer: Thomas Jost <schnouki@schnouki.net>
pkgname=python-aranet4
_name=${pkgname#python-}
pkgver=2.6.0
pkgrel=1
pkgdesc="Python client for Aranet4 CO2 sensors"
arch=(any)
url="https://github.com/Anrijs/Aranet4-Python"
license=('MIT')
depends=('python-bleak' 'python-requests')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('3821fc19d3572b0cbea8c0f913155b215126575f87361f41eb146f0c3c49e01a')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
