# Maintainer: Patrik Bachan	<patrikbachan AT gmail DOT net>
_name=canalystii
pkgname=python-canalystii
pkgver=0.1
pkgrel=3
pkgdesc='Canalyst-II USB CAN probe Driver for Python'
arch=('any')
url="https://github.com/projectgus/python-canalystii"
license=('BSD')
source=(
    "https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
    "99-canalystii.rules"
)
sha256sums=(
    '7471e09cdf85c407fd4a7ee0fd4e6de714eb9fca57434befbff02b801dcf0f84'
    'f8788c2fd89be6e62c289b0a88eb9154f2f5b7f2579e755a8727c6df5ac35990'
)

depends=(python python-pyusb)
makedepends=(python-build python-installer python-wheel)

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 "${srcdir}/99-canalystii.rules" "${pkgdir}/etc/udev/rules.d/99-canalystii.rules"
}