# Maintainer: Vladimir Gorbunov <truedaemon@gmail.com>
pkgname=python-tkvdb
pkgver=0.2.2
pkgrel=1
pkgdesc="Cython wrapper for tkvdb radix trie key-value database"
arch=('x86_64')
url="https://github.com/vladimir-g/python-tkvdb/"
license=('ISC')
depends=('python')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/p/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('2c8b616451854f43ed0954b901089a9bf042d71d9ea7030b51d831862f487b90')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
    PYTHONDONTWRITEBYTECODE=1 PYTHONPATH="$PWD/build/lib.linux-$CARCH-${python_version}" python -B -m unittest
}
