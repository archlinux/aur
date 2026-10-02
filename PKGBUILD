# Maintainer: Egor Tensin <egor@tensin.name>

# Basic Python packaging instructions are from
# https://manual.archlinux.page/package-guidelines/python/

pkgname=tag-release
_name="git-$pkgname"
_name="${_name//-/_}"
pkgver=0.4.11
pkgrel=1
pkgdesc='Automate creation of semantic versioning tags'
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
