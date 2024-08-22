# Maintainer: Vladimir Gorbunov <truedaemon@gmail.com>
pkgname=python-tkvdb
_name=${pkgname//-/_}
pkgver=0.2.3
pkgrel=1
pkgdesc="Cython wrapper for tkvdb radix trie key-value database"
arch=('x86_64')
url="https://github.com/vladimir-g/python-tkvdb/"
license=('ISC')
depends=('python')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/p/${_name}/${_name}-$pkgver.tar.gz")
sha256sums=('0338c3b84a1faac09c4fe0edae484aeb609798d29d639215b28e70c733f7de79')

build() {
    cd "$srcdir/${_name}-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/${_name}-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

check() {
    cd "$srcdir/${_name}-$pkgver"
    local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
    PYTHONDONTWRITEBYTECODE=1 PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-${python_version}" python -B -m unittest
}
