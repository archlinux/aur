# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>

_pyname=unique_log_filter
pkgname=python-${_pyname}
pkgver=0.1.0
pkgrel=1
pkgdesc="Simple tool to filter out duplicate lines from a log file"
arch=('any')
url="https://github.com/twizmwazin/unique_log_filter"
license=('BSD-2-Clause')
depends=('python>=3.7')
makedepends=('python-setuptools' 'python-flit')
source=(
    https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz
    https://github.com/twizmwazin/unique_log_filter/blob/v0.1.0/LICENSE
)
b2sums=('0241050090dc7953164ef69cad358db1d50381aaee4796534cf04b02748975b1c0f497be71e566ad3f1af94dfce2513bfd7fe7dd2b88b638df148843cb96af3e'
        'd4b38c98c7187173c4b70f3bd654221dd50d36e9e1cf82e4c69f153fd2a6eb32db0beee1f3026dfecf2ab6be84da22b19c09c9cf20416573615d388dd14b0caf')

build() {
    cd $srcdir/$_pyname-$pkgver
#    python setup.py build
    python -m build --wheel --no-isolation
}

package() {
    cd $srcdir
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"

    cd $_pyname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
