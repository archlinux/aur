# Maintainer: Vekhir <vekhir at yahoo dot com>

pkgname=python-standard-chunk
_pkg="${pkgname#python-}"
_pkg="${_pkg//-/_}"
pkgver=3.13.0
pkgrel=1
pkgdesc="Standard library chunk redistribution."
arch=('any')
url="https://github.com/youknowone/python-deadlib/tree/main/chunk"
license=('PSF-2.0')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
provides=('python-chunk')
source=("$pkgname-$pkgver.tar.gz::https://github.com/youknowone/python-deadlib/releases/download/v$pkgver/$_pkg-$pkgver.tar.gz")
sha512sums=('ddd837eb77c8a81fed7dbb28c790031269cbafe80428a6ca4b789cc20ef6f2537c6cb1bd333e94357377245e7bc2c680a5ceadc1f1dc73304057eace332ac188')

build() {
    cd "$_pkg-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkg-$pkgver"
    python -m installer --destdir="$pkgdir/" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
