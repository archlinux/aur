# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Matt Quintanilla <matt @ matt quintanilla . xyz>
# Contributor: Liam Timms <timms5000@gmail.com>

pkgname=python-jenkspy
pkgver=0.4.1
pkgrel=2
pkgdesc='Compute Natural Breaks in Python (Fisher-Jenks algorithm)'
arch=(x86_64)
url='https://github.com/mthh/jenkspy'
license=(MIT)
depends=(python-numpy python)
makedepends=(cython python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('603c8ea88ebd7433bc2b74c9e149e938b0c6c15bebdc8bf7e36db8dccd0ba5e00ba11e624d13517fbbd6d466b8eb99baec7834d9fc7cdf2f02dd0c281433fc76')

build() {
    cd "jenkspy-$pkgver"
    python -m build --wheel --no-isolation
}

# check() {
#     cd "jenkspy-$pkgver"
#     pytest -x
# }

package() {
    cd "jenkspy-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    local _site=$(python -c "import site; print(site.getsitepackages()[0])")
    install -d "$pkgdir/usr/share/licenses/$pkgname/"
    ln -s "$_site/jenkspy-$pkgver.dist-info/licenses/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

