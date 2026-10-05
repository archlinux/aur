# Maintainer: Egor Tensin <egor@tensin.name>

# Basic Python packaging instructions are from
# https://manual.archlinux.page/package-guidelines/python/

pkgname=cmake-common
_name="${pkgname//-/_}"
pkgver=7.0.0
pkgrel=1
pkgdesc='Utilities to help develop C++/CMake projects'
arch=(any)
url="https://github.com/egor-tensin/$pkgname"
license=(MIT)
makedepends=(python-build python-installer python-setuptools-scm python-wheel)
depends=(python)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
md5sums=(SKIP)

build() {
    cd -- "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd -- "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
