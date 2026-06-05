# Maintainer: a821 (nospam) mail de

pkgname=python-encutils
_name="${pkgname#python-}"
pkgver=1.0.0
pkgrel=1
pkgdesc="encoding detection collection for Python"
arch=(any)
url="https://github.com/coherent-oss/encutils"
license=('LGPL-3.0-or-later')
depends=(python python-chardet)
makedepends=(python-build python-flit-core python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('38eca5af18cebabd8be43c17f14c9d3fbba83cc5f7ac8e3ab1c86e24c4b2b91a')

prepare() {
    cd "$_name-$pkgver"
    sed -i 's/, <4//' pyproject.toml
}

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
