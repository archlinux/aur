# Maintainer: dringsim <dringsim@qq.com>

pkgname=python-mariadb-kernel
_name=mariadb_kernel
pkgver=0.2.0
pkgrel=2
pkgdesc="A simple MariaDB Jupyter kernel"
arch=('any')
url="https://github.com/MariaDB/mariadb_kernel"
license=('BSD-3-Clause')
makedepends=('python-build' 'python-installer' 'python-wheel')
depends=('python-jupyter-client' 'python-pandas' 'python-json2html' 'python-matplotlib' 'python-lxml' 'python-beautifulsoup4' 'mycli')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('b136b1997bbb34e6a638dcffce9a5320ffcff7d79a04cf0dea08771bc4e23fff')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    python mariadb_kernel/install.py --prefix="$pkgdir/usr"
}
