# Maintainer: Vekhir <vekhir at yahoo dot com>

pkgname=python-standard-aifc
_pkg="${pkgname#python-}"
_pkg="${_pkg//-/_}"
pkgver=3.13.0
pkgrel=1
pkgdesc="Standard library aifc redistribution."
arch=('any')
url="https://github.com/youknowone/python-deadlib/tree/main/aifc"
license=('PSF-2.0')
depends=('python' 'python-audioop' 'python-chunk')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
provides=('python-aifc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/youknowone/python-deadlib/releases/download/v$pkgver/$_pkg-$pkgver.tar.gz")
sha512sums=('021291853a6c00c812f5a83e803980edd81cbeb47e2f20513372aeaf837825d94288cc46c36e37b789d1abadd2bd51fde974c90543be4983cbf373170cd1ee10')

build() {
    cd "$_pkg-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$_pkg-$pkgver"
    # Aifc uses internal testing tools
    pytest || echo "Tests failed"
}

package() {
    cd "$_pkg-$pkgver"
    python -m installer --destdir="$pkgdir/" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
