# Maintainer: Bipin Kumar <bipin@ccmb.res.in>

pkgname=python-xopen
_module=${pkgname#python-}
pkgver=1.7.0
pkgrel=2
pkgdesc='Python library to pen compressed files transparently'
arch=('any')
url="https://github.com/pycompression/xopen/"
license=('MIT')
depends=(
        'python'
        'python-typing_extensions'
        'python-zstandard'
        'python-isal'
        )
makedepends=(
            'python-build'
            'python-installer'
            'python-wheel'
            'python-setuptools-scm'
            )
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('901f9c8298e95ed74767a4bd76d9f4cf71d8de27b8cf296ac3e7bc1c11520d9f')

build() {
    cd "$_module-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_module-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 "$srcdir/$_module-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
