# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: pappy <pa314159@users.noreply.github.com>

pkgname=python-sarge
pkgver=0.1.8
pkgrel=2
pkgdesc="A wrapper for subprocess which provides command pipeline functionality."
arch=(any)
url="https://github.com/vsajip/sarge"
license=(BSD-3-Clause)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('4eecccbf3aee4e30a6ecb8a8821b7bd31627c6aff6c1582057c357ea13e23352')

build() {
    cd "sarge-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "sarge-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    local _site=$(python -c "import site; print(site.getsitepackages()[0])")
    install -d "$pkgdir/usr/share/licenses/$pkgname/"
    ln -s "$_site/sarge-$pkgver.dist-info/licenses/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
