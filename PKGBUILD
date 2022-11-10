# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=types-retry
pkgname=python-$_name
pkgver=0.9.9
pkgrel=2
pkgdesc='Typing stubs for retry'
arch=(any)
url='https://github.com/python/typeshed'
license=('Apache' 'MIT')
depends=(python)
makedepends=(python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        "https://github.com/python/typeshed/blob/28e24a4664b814e6767b45e8eaac7d40d14b4765/LICENSE")
b2sums=('c19542cfb6b6ec785de3afe4787bb1d51ec48fa33a3592db99d920bdd623f9eac9f061fe6c970076d4a341f4333a13155b3305d6ccc73ce837487b8c2dd0e925'
        '854309e731f00510e6c17f617773b9401c492f124b385d5852e2bf3535bfb6799bc3669f19664675c5135e992154e259d7020d920209a141ad478d7fcb653610')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
