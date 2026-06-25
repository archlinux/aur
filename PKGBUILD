# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-smda
pkgver=4.2.0
pkgrel=1
pkgdesc="Recursive diassembler optimized for CFG recovery from memory dumps"
arch=(any)
url="https://github.com/danielplohmann/smda"
license=(BSD-2-Clause)
depends=(python python-capstone python-dncil python-dnfile lief)
makedepends=(python-setuptools python-build python-installer python-wheel)
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/s/smda/smda-$pkgver.tar.gz")
sha256sums=('a3a3ef7999762c3e58fa826fcadf3b03a375672f6f702d01610d8969cec42c82')

build() {
    cd "smda-$pkgver"
    python -m build --wheel --no-isolation
}

## check()
# Upstream does not provide test data in their wheel packages. The only way
# to get that data is to grab it from GitHub, but they don't provide releases
# there either.

package() {
    cd "smda-$pkgver"
    python -m installer --destdir="$pkgdir/" dist/*.whl
    local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
    install -d "$pkgdir/usr/share/licenses/$pkgname/"
    ln -s "$_site/smda-$pkgver.dist-info/licenses/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
