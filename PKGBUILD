# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>

_pyname=unique_log_filter
pkgname=python-${_pyname}
pkgver=0.1.0
pkgrel=3
pkgdesc="Simple tool to filter out duplicate lines from a log file"
arch=('any')
url="https://github.com/twizmwazin/unique_log_filter"
license=('BSD-2-Clause')
depends=('python>=3.7')
makedepends=('python-build' 'python-flit' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/twizmwazin/unique_log_filter/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('95306ad03625d96580b7ffda3265f1347ffd6d331f6de8a7f43a84dc98637b0b90df0e8b7abcba435e59fa6534bf37d3359dcf34aa2bec00e9cafeacbfca1be4')

build() {
    cd $srcdir/$_pyname-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_pyname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
